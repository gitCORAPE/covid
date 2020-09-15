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
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import static com.cmue.umamakiapp.App.CHANNEL_1_ID;

public class AsyncTaskAllContent extends AsyncTask<Object, Void, String> {

    private Activity context;
    private Activity mainContext;
    private NotificationManagerCompat notificationManager;
    private String generalResult;
    private List<Content> contentList = new ArrayList<>();
    private List<Content> contentNoSendList = new ArrayList<>();
    private Gson gson = new GsonBuilder().disableHtmlEscaping().create();


    public AsyncTaskAllContent(Activity context) {

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

        if (generalResult != null) {
            contentNoSendList.addAll(contentList);
        } else {
            Gson gson = new GsonBuilder()
                    .registerTypeAdapter(Date.class, new DateDeserializer())
                    .disableHtmlEscaping().create();
            for (Content aux : contentList) {
                try {
                    if (aux.getPostType().equals(mainContext.getString(R.string.take_picture))) {
                        response = restClient.eventPostContentImage(aux);
                    } else if (aux.getPostType().equals(mainContext.getString(R.string.record_video))) {
                        response = restClient.eventPostContentVideo(aux);
                    } else {
                        response = restClient.eventPostContentAudio(aux);
                    }
                    Content auxContent = gson.fromJson(response, Content.class);
                    response = gson.toJson(auxContent);
                } catch (Exception e) {
                    generalResult = mainContext.getString(R.string.error_unexpected);
                    contentNoSendList.add(aux);
                }
            }
        }

        return response;

    }


    @Override
    protected void onPreExecute() {

        super.onPreExecute();
        Toast.makeText(mainContext.getApplicationContext(),
                "Todos los contenidos se han empezado a subir", Toast.LENGTH_LONG).show();
        context.finish();

    }


    @Override
    protected void onPostExecute(String result) {

        Content[] contents = new Content[contentNoSendList.size()];
        for (int i = 0; i < contents.length; i++) {
            contents[i] = contentNoSendList.get(i);
        }
        String jsonContent = gson.toJson(contents);

        if (generalResult == null) {
            sendPushSuccessful(mainContext.getString(R.string.sendAll_successful));
        } else if (generalResult.equals(mainContext.getString(R.string.error_access_internet))) {
            sendPushError(mainContext.getString(R.string.sendAll_error_internet));
        } else {
            sendPushError(mainContext.getString(R.string.sendAll_error_server));
        }
        saveData(jsonContent);

    }

    private void saveData(String jsonData) {

        try {
            OutputStreamWriter fileUser =
                    new OutputStreamWriter(
                            mainContext.openFileOutput("jsonOffline.txt", Context.MODE_PRIVATE));
            fileUser.write(jsonData);
            fileUser.close();
        } catch (Exception e) {
            Log.e("SaveData AllContent",e.toString());
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

    private void validateOffline() {

        try {
            BufferedReader readToken = new BufferedReader(
                    new InputStreamReader(mainContext.openFileInput("jsonOffline.txt")));
            String jOffline = readToken.readLine();
            readToken.close();

            Content[] list = gson.fromJson(jOffline, Content[].class);
            contentList = Arrays.asList(list);
        } catch (Exception e) {
            contentList = new ArrayList<>();
        }

    }

}
