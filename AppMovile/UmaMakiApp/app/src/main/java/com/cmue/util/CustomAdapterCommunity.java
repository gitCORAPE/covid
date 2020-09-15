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
import android.widget.TextView;

import com.cmue.model.Community;
import com.cmue.model.ContentCommunity;
import com.cmue.umamakiapp.R;
import com.cmue.umamakiapp.SeeSpecificTownActivity;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class CustomAdapterCommunity extends BaseAdapter {

    private Activity context;
    private Community[] communityList;
    private LayoutInflater inflater;

    public CustomAdapterCommunity(Activity applicationContext, Community[] communities) {

        this.context = applicationContext;
        this.communityList = communities;
        this.inflater = (LayoutInflater.from(applicationContext));

    }

    @Override
    public int getCount() {
        return communityList.length;
    }

    @Override
    public Object getItem(int position) {
        return communityList[position];
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(final int position, View convertView, ViewGroup parent) {

        convertView = inflater.inflate(R.layout.item_lst_all_communities, null);

        TextView txt_community_name = convertView.findViewById(R.id.txt_community_name);
        TextView txt_nationality_name = convertView.findViewById(R.id.txt_community_nationality);

        convertView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                new CustomAdapterCommunity.AsyncTaskGetSpecificCommunity()
                        .execute(communityList[position].get_id());
            }
        });

        String communityName = communityList[position].getName() != null
                ? communityList[position].getName().toUpperCase() : "";
        String nationalityName = communityList[position].getNationality().getName() != null
                ? communityList[position].getNationality().getName() : "";

        txt_community_name.setText(communityName);
        txt_nationality_name.setText(nationalityName);

        return convertView;

    }

    private class AsyncTaskGetSpecificCommunity extends AsyncTask<Object, Void, String> {

        private String generalResult;
        private ProgressDialog progressDialog;
        private ContentCommunity community;
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
                community = null;
                try {
                    String result = restClient.eventGet("communities/" + idContent);
                    community = gson.fromJson(result, ContentCommunity.class);
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
                Intent intent = new Intent(context.getApplicationContext(), SeeSpecificTownActivity.class);
                intent.putExtra(context.getString(R.string.intent_content_information), gson.toJson(community));
                (context).startActivity(intent);
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
