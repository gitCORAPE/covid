package com.cmue.umamakiapp;

import androidx.appcompat.app.AppCompatActivity;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.pm.ActivityInfo;
import android.os.Bundle;
import android.view.View;
import android.widget.ListView;
import android.widget.TextView;

import com.cmue.model.Content;
import com.cmue.util.AsyncTaskAllContent;
import com.cmue.util.CustomAdapterOfflineContent;
import com.cmue.util.Singleton;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class OfflineContentActivity extends AppCompatActivity {

    private Content[] list_content;
    private Gson gson = new GsonBuilder().disableHtmlEscaping().create();

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_offline_content);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);

        validateOffline();

        ListView lstViewContent = findViewById(R.id.lstContent);
        TextView btnSendAll = findViewById(R.id.btnSendAll);

        if (list_content.length == 0) {
            AlertDialog.Builder alertDialog = new AlertDialog.Builder(OfflineContentActivity.this);
            alertDialog.setTitle(getString(R.string.title_offline_content));
            alertDialog.setCancelable(false);
            alertDialog.setMessage(getString(R.string.no_offline_content));
            alertDialog.setNeutralButton(getString(R.string.btn_accept_offline_content),
                    new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int which) {
                            finish();
                        }
                    });
            alertDialog.show();
        } else {
            CustomAdapterOfflineContent customAdapter = new CustomAdapterOfflineContent(OfflineContentActivity.this, list_content);
            lstViewContent.setAdapter(customAdapter);

        }

        Singleton.getInstance().setOfflineActivity(OfflineContentActivity.this);

        btnSendAll.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                android.app.AlertDialog.Builder alertDialog;
                alertDialog = new android.app.AlertDialog.Builder(OfflineContentActivity.this);
                alertDialog.setTitle(getString(R.string.title_send_content));
                alertDialog.setMessage(getString(R.string.confirm_sendAll_content));
                alertDialog.setNeutralButton(getString(R.string.accept_confirmation),
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {
                                new AsyncTaskAllContent(OfflineContentActivity.this).execute();
                                //Toast.makeText(getApplicationContext(), gson.toJson(content), Toast.LENGTH_LONG).show();
                            }
                        });
                alertDialog.setPositiveButton(getString(R.string.cancel_confirmation),
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {

                            }
                        });
                alertDialog.show();

            }
        });

    }


    public void validateOffline() {

        try {
            BufferedReader readToken = new BufferedReader(
                    new InputStreamReader(openFileInput("jsonOffline.txt")));
            String jOffline = readToken.readLine();
            readToken.close();
            list_content = gson.fromJson(jOffline, Content[].class);
        } catch (Exception e) {
            list_content = new Content[]{};
        }

    }

}
