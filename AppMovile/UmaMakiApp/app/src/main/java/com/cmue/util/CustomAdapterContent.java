package com.cmue.util;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.AsyncTask;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.cmue.model.ContentPost;
import com.cmue.model.User;
import com.cmue.umamakiapp.R;
import com.cmue.umamakiapp.SeeSpecificContentActivity;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


public class CustomAdapterContent extends BaseAdapter {

    private Activity context;
    private ContentPost[] contentList;
    private LayoutInflater inflater;
    private User user;

    public CustomAdapterContent(Activity applicationContext, ContentPost[] contents, User user) {

        this.context = applicationContext;
        this.contentList = contents;
        this.inflater = (LayoutInflater.from(applicationContext));
        this.user = user;

    }

    @Override
    public int getCount() {
        return contentList.length;
    }

    @Override
    public Object getItem(int position) {
        return contentList[position];
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(final int position, View convertView, ViewGroup parent) {

        convertView = inflater.inflate(R.layout.item_lst_all_content, null);

        TextView txt_theme_content = convertView.findViewById(R.id.txt_theme_content);
        TextView txt_author_content = convertView.findViewById(R.id.txt_author_content);
        TextView txt_type_content = convertView.findViewById(R.id.txt_type_content);
        ImageView img_type_content = convertView.findViewById(R.id.img_type_content);

        convertView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                new AsyncTaskGetSpecificContent().execute(contentList[position].get_id());

            }
        });

        String theme = contentList[position].getTopic() != null
                ? contentList[position].getTopic().toUpperCase() : "";
        String author = contentList[position].getUser() != null
                ? contentList[position].getUser().getName() : "";
        String type = contentList[position].getPostType() != null
                ? contentList[position].getPostType() : "";

        txt_theme_content.setText(theme);
        txt_author_content.setText(author);
        txt_type_content.setText(type);

        int image = R.drawable.icon_content;
        switch (type) {
            case "Video":
                image = R.drawable.icon_video;
                break;
            case "Image":
                image = R.drawable.icon_camera;
                break;
            case "Audio":
                image = R.drawable.icon_audio;
                break;
        }
        img_type_content.setImageResource(image);

        return convertView;

    }

    private class AsyncTaskGetSpecificContent extends AsyncTask<Object, Void, String> {

        private String generalResult;
        private ProgressDialog progressDialog;

        private ContentPost contentPost;
        private Gson gson = new GsonBuilder().disableHtmlEscaping().create();

        @Override
        protected void onPreExecute() {
            progressDialog = ProgressDialog.show(
                    context, "Por favor espere", "Procesando...");
        }

        @Override
        protected String doInBackground(Object... obj) {

            String idContent = (String) obj[0];
            RestClient restClient = new RestClient();

            generalResult = UtilFunctions.validateOnlineNetServices();

            if (generalResult == null) {
                contentPost = null;
                try {
                    String result = restClient.eventGet("contentPosts/"
                            + idContent + "/currentUser/" + user.get_id());
                    contentPost = gson.fromJson(result, ContentPost.class);
                } catch (Exception e) {
                    generalResult = context.getString(R.string.error_unexpected);
                }
            }

            return null;

        }

        @Override
        protected void onPostExecute(String result) {

            progressDialog.dismiss();

            if (generalResult == null) {
                Singleton.getInstance().setCurrentUser(user);
                Intent intent = new Intent(context.getApplicationContext(), SeeSpecificContentActivity.class);
                Singleton.getInstance().setContentPost(contentPost);
                context.startActivity(intent);
            } else {
                AlertDialog.Builder alertDialog = new AlertDialog.Builder(context);
                alertDialog.setTitle(context.getString(R.string.title_content));
                alertDialog.setCancelable(false);
                alertDialog.setMessage(generalResult);
                alertDialog.setNeutralButton(context.getString(R.string.btn_accept_offline_content),
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {
                            }
                        });
                alertDialog.show();
            }

        }

    }

}
