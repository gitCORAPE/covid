package com.cmue.util;

import android.app.Activity;
import android.app.Notification;
import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;
import android.widget.Toast;

import androidx.core.app.NotificationCompat;
import androidx.core.app.NotificationManagerCompat;

import com.cmue.model.Content;
import com.cmue.umamakiapp.R;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.cmue.umamakiapp.App.CHANNEL_1_ID;

public class AsyncTaskContent extends AsyncTask<Object, Void, String> {

    private Activity context;
    private Activity mainContext;
    private NotificationManagerCompat notificationManager;
    private String generalResult;
    private List<Content> contentList = new ArrayList<>();
    private Gson gson = new GsonBuilder().disableHtmlEscaping().create();

    public AsyncTaskContent(Activity context) {

        this.context = context;
        this.mainContext = Singleton.getInstance().getMainContent();
        notificationManager = NotificationManagerCompat.from(mainContext);
        validateOffline();

    }

    @Override
    protected String doInBackground(Object... obj) {

        String response = "";
        RestClient restClient = new RestClient();
        generalResult = UtilFunctions.validateOnlineNetServices();
        Content content = (Content) obj[0];
        contentList.add(content);


        if (generalResult == null) {
            try {
                Gson gson = new GsonBuilder()
                        .registerTypeAdapter(Date.class, new DateDeserializer())
                        .disableHtmlEscaping().create();

                if (content.getPostType().equals(mainContext.getString(R.string.take_picture))) {
                    response = restClient.eventPostContentImage(content);
                } else if (content.getPostType().equals(mainContext.getString(R.string.record_video))) {
                    response = restClient.eventPostContentVideo(content);
                } else {
                    response = restClient.eventPostContentAudio(content);
                }

                Content auxContent = gson.fromJson(response, Content.class);
                response = gson.toJson(auxContent);
            } catch (Exception e) {
                generalResult = mainContext.getString(R.string.error_unexpected);
            }
        }

        return response;

    }


    @Override
    protected void onPreExecute() {

        super.onPreExecute();
        Toast.makeText(mainContext.getApplicationContext(),
                "El contenido se ha empezado a subir", Toast.LENGTH_LONG).show();
        context.finish();

    }


    @Override
    protected void onPostExecute(String result) {

        Content[] contents = new Content[contentList.size()];
        for (int i = 0; i < contents.length; i++) {
            contents[i] = contentList.get(i);
        }

        String jsonContent = gson.toJson(contents);

        if (generalResult == null) {
            sendPushSuccessful(mainContext.getString(R.string.send_successful));
        } else if (generalResult.equals(mainContext.getString(R.string.error_access_internet))) {
            saveData(jsonContent);
            sendPushError(mainContext.getString(R.string.send_error_internet));
        } else {
            saveData(jsonContent);
            sendPushError(mainContext.getString(R.string.send_error_server));
        }

    }

    private void saveData(String jsonData) {

        try {
            OutputStreamWriter fileUser =
                    new OutputStreamWriter(
                            mainContext.openFileOutput("jsonOffline.txt",
                                    Context.MODE_PRIVATE));
            fileUser.write(jsonData);
            fileUser.close();
        } catch (Exception e) {
            Log.e("Error SaveData", e.toString());
        }

    }


    private void sendPushSuccessful(String message) {

        Notification notification = new NotificationCompat.Builder(mainContext, CHANNEL_1_ID)
                .setSmallIcon(R.drawable.ic_successful)
                .setContentTitle(mainContext.getString(R.string.title_send_content))
                .setContentText(message)
                .setStyle(new NotificationCompat.BigTextStyle()
                        .bigText(message)
                        .setBigContentTitle(mainContext.getString(R.string.title_send_content)))
                .setPriority(NotificationCompat.PRIORITY_HIGH)
                .setCategory(NotificationCompat.CATEGORY_MESSAGE)
                .build();
        notificationManager.notify(1, notification);

    }

    private void sendPushError(String message) {

        Notification notification = new NotificationCompat.Builder(mainContext, CHANNEL_1_ID)
                .setSmallIcon(R.drawable.ic_error)
                .setContentTitle(mainContext.getString(R.string.title_send_content))
                .setContentText(message)
                .setStyle(new NotificationCompat.BigTextStyle()
                        .bigText(message)
                        .setBigContentTitle(mainContext.getString(R.string.title_send_content)))
                .setPriority(NotificationCompat.PRIORITY_HIGH)
                .setCategory(NotificationCompat.CATEGORY_MESSAGE)
                .build();
        notificationManager.notify(1, notification);

    }

    public boolean validateOffline() {
        boolean flag;
        try {
            BufferedReader readToken = new BufferedReader(
                    new InputStreamReader(mainContext.openFileInput("jsonOffline.txt")));
            String jOffline = readToken.readLine();
            readToken.close();
            Content[] list = gson.fromJson(jOffline, Content[].class);
            for (Content aux : list) {
                contentList.add(aux);
            }
            flag = true;
        } catch (Exception e) {
            contentList = new ArrayList<>();
            flag = false;
        }
        return flag;
    }

}
