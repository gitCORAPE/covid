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

import com.cmue.model.User;
import com.cmue.umamakiapp.R;
import com.cmue.umamakiapp.SeeSpecificUserActivity;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


public class CustomAdapterUser extends BaseAdapter {

    private Activity context;
    private User[] userList;
    private LayoutInflater inflater;

    public CustomAdapterUser(Activity applicationContext, User[] users) {

        this.context = applicationContext;
        this.userList = users;
        this.inflater = (LayoutInflater.from(applicationContext));

    }

    @Override
    public int getCount() {
        return userList.length;
    }

    @Override
    public Object getItem(int position) {
        return userList[position];
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(final int position, View convertView, ViewGroup parent) {

        convertView = inflater.inflate(R.layout.item_lst_all_users, null);

        TextView txt_name_user = convertView.findViewById(R.id.txt_name_user);
        TextView txt_community_user = convertView.findViewById(R.id.txt_community_user);
        TextView txt_badge_user = convertView.findViewById(R.id.txt_badge_user);
        ImageView img_badge_user = convertView.findViewById(R.id.img_badge_user);

        convertView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                new AsyncTaskGetSpecificUser().execute(userList[position].get_id());

            }
        });

        String name = userList[position].getName() != null
                ? userList[position].getName() : "";
        String community = userList[position].getCommunity() != null
                ? userList[position].getCommunity() : "";
        String auxBadge = userList[position].getBadge() != null
                ? userList[position].getBadge().toLowerCase() : "";

        String badge = auxBadge.length() > 1 ? auxBadge.substring(0, 1).toUpperCase() + auxBadge.substring(1) : auxBadge;

        txt_name_user.setText(name);
        txt_community_user.setText(community);
        txt_badge_user.setText(badge);

        int image = R.drawable.bronze_medal;
        switch (badge.toUpperCase()) {
            case "COMPA":
                image = R.drawable.silver_medal;
                break;
            case "COMUNICADOR":
                image = R.drawable.gold_medal;
                break;
        }

        img_badge_user.setImageResource(image);

        return convertView;

    }

    private class AsyncTaskGetSpecificUser extends AsyncTask<Object, Void, String> {

        private String generalResult;
        private ProgressDialog progressDialog;

        private User user;
        private Gson gson = new GsonBuilder().disableHtmlEscaping().create();

        @Override
        protected void onPreExecute() {
            progressDialog = ProgressDialog.show(
                    context, "Por favor espere", "Procesando...");
        }

        @Override
        protected String doInBackground(Object... obj) {

            String idUser = (String) obj[0];
            RestClient restClient = new RestClient();

            generalResult = UtilFunctions.validateOnlineNetServices();

            if (generalResult == null) {
                user = null;
                try {
                    String result = restClient.eventGet("users/id/" + idUser);
                    user = gson.fromJson(result, User.class);
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
                Intent intent = new Intent(context.getApplicationContext(), SeeSpecificUserActivity.class);
                Singleton.getInstance().setSpecificUser(user);
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
