package com.cmue.umamakiapp;

import androidx.appcompat.app.AppCompatActivity;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.cmue.model.Community;
import com.cmue.model.Content;
import com.cmue.util.RestClient;
import com.cmue.util.Singleton;
import com.cmue.util.UtilFunctions;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.cmue.model.User;

import org.w3c.dom.Text;

public class MainActivity extends AppCompatActivity {

    private Content[] contentList;
    private Gson gson = new GsonBuilder().disableHtmlEscaping().create();
    private User user;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);

        user = readCurrentUser();
        contentList = readContents();

        try {
            if (!getIntent().getExtras().getBoolean("updated")) {
                new AsyncTaskGetUserOnline().execute();
            }

        } catch (Exception e) {
            Log.e("Error main", e.toString());
        }

        final String jsonUser = new Gson().toJson(user);

        //Profile Information
        TextView txtUserName = findViewById(R.id.txtUserName);
        TextView txtCommunityName = findViewById(R.id.txtCommunityName);
        TextView txtBadgeName = findViewById(R.id.txtBadgeName);

        TextView btnSendContent = findViewById(R.id.btnSendContent);
        TextView btnOfflineContent = findViewById(R.id.btnOfflineContent);
        TextView btnModerate = findViewById(R.id.btnModerate);
        TextView btnSeeContent = findViewById(R.id.btnSeeContent);
        TextView btnMeetCommunity = findViewById(R.id.btnMeetCommunity);
        TextView btnMeetUser = findViewById(R.id.btnMeetUser);
        TextView btnSeeMyProfile = findViewById(R.id.btnSeeMyProfile);

        Singleton.getInstance().setMainContent(MainActivity.this);
        Singleton.getInstance().setCurrentUser(user);
        btnModerate.setVisibility(View.GONE);

        btnSendContent.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intentSendContent = new Intent(getApplicationContext(), SendContentActivity.class);
                intentSendContent.putExtra(getString(R.string.intent_user_information), jsonUser);
                startActivity(intentSendContent);
            }
        });

        btnSeeContent.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intentSeeContent = new Intent(getApplicationContext(), SeeContentActivity.class);
                intentSeeContent.putExtra(getString(R.string.intent_user_information), jsonUser);
                startActivity(intentSeeContent);
            }
        });

        btnOfflineContent.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intentOfflineContent = new Intent(getApplicationContext(), OfflineContentActivity.class);
                intentOfflineContent.putExtra(getString(R.string.intent_user_information), jsonUser);
                startActivity(intentOfflineContent);
            }
        });

        btnMeetCommunity.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intentSeeTowns = new Intent(getApplicationContext(), SeeTownsActivity.class);
                startActivity(intentSeeTowns);
            }
        });


        btnMeetUser.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intentSeeUsers = new Intent(getApplicationContext(), SeeUsersActivity.class);
                intentSeeUsers.putExtra(getString(R.string.intent_user_information), jsonUser);
                startActivity(intentSeeUsers);
            }
        });

        btnModerate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intentSeeContent = new Intent(getApplicationContext(), SeeContentActivity.class);
                intentSeeContent.putExtra(getString(R.string.intent_user_information), jsonUser);
                intentSeeContent.putExtra("query_filter", "?community=" + user.getCommunityId() + "&inReview=true");
                startActivity(intentSeeContent);
            }
        });

        btnSeeMyProfile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intentSeeSpecificUser = new Intent(getApplicationContext(), SeeSpecificUserActivity.class);
                Singleton.getInstance().setSpecificUser(user);
                startActivity(intentSeeSpecificUser);
            }
        });

        txtUserName.setText(user.getName());
        txtCommunityName.setText(user.getCommunity());
        txtBadgeName.setText(user.getBadge());

        if ("COMUNICADOR".equals(user.getBadge())) {
            btnModerate.setVisibility(View.VISIBLE);
        }

        if (contentList != null && contentList.length != 0) {
            deleteContent();
        }

    }

    public void deleteContent() {

        Date date = new Date();
        final List<Content> newContentList = new ArrayList<>();
        String contentToDelete = "";
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        for (Content content : contentList) {
            int days = (int) ((date.getTime() - content.getDate().getTime()) / 86400000);
            if (days <= 7) {
                newContentList.add(content);
            } else {
                contentToDelete += "\n" + content.getTopic() + " -> " + format.format(content.getDate());
            }
        }

        if (newContentList.size() != contentList.length) {

            android.app.AlertDialog.Builder alertDialog;
            alertDialog = new android.app.AlertDialog.Builder(MainActivity.this);
            alertDialog.setTitle(getString(R.string.title_delete_content));
            alertDialog.setMessage(getString(R.string.confirm_delete_week_content) + contentToDelete);
            alertDialog.setNeutralButton(getString(R.string.accept_confirmation),
                    new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int which) {
                            if (saveData(gson.toJson(newContentList), "jsonOffline.txt")) {
                                Toast.makeText(getApplicationContext(), getString(R.string.delete_successful), Toast.LENGTH_SHORT).show();
                            } else {
                                Toast.makeText(getApplicationContext(), getString(R.string.delete_error), Toast.LENGTH_SHORT).show();
                            }
                        }
                    });
            alertDialog.setPositiveButton(getString(R.string.cancel_confirmation),
                    new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialog, int which) {
                        }
                    });

            alertDialog.show();
        }

    }

    public User readCurrentUser() {

        try {
            BufferedReader readToken = new BufferedReader(
                    new InputStreamReader(openFileInput("jsonUser.txt")));
            String userOffline = readToken.readLine();
            readToken.close();
            return gson.fromJson(userOffline, User.class);
        } catch (Exception e) {
            return null;
        }

    }

    public Content[] readContents() {

        try {
            BufferedReader readToken = new BufferedReader(
                    new InputStreamReader(openFileInput("jsonOffline.txt")));
            String contentsOffline = readToken.readLine();
            readToken.close();
            return gson.fromJson(contentsOffline, Content[].class);
        } catch (Exception e) {
            return null;
        }

    }

    public boolean saveData(String jsonData, String jsonName) {
        try {
            OutputStreamWriter fileUser =
                    new OutputStreamWriter(
                            openFileOutput(jsonName, Context.MODE_PRIVATE));
            fileUser.write(jsonData);
            fileUser.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    private class AsyncTaskGetUserOnline extends AsyncTask<Void, Integer, Void> {

        private String generalResult;
        private ProgressDialog progressDialog;
        private User userOnline = null;
        private User userOffline = null;

        @Override
        protected void onPreExecute() {
            progressDialog = ProgressDialog.show(
                    MainActivity.this, "Por favor espere", "Estamos cargando su información...");
        }

        @Override
        protected Void doInBackground(Void... voids) {
            Gson gson = new GsonBuilder().disableHtmlEscaping().create();
            RestClient restClient = new RestClient();
            userOffline = readCurrentUser();

            generalResult = UtilFunctions.validateOnlineNetServices();

            if (generalResult == null) {
                try {
                    String result_user = restClient.eventGet("users/id/" + userOffline.get_id());
                    String communityJson = restClient.eventGet("communities/"+userOffline.getCommunity()+"/page/0");

                    userOnline = gson.fromJson(result_user, User.class);
                    Community [] communities = gson.fromJson(communityJson,Community[].class);
                    Community community = communities[0];
                    userOnline.setCommunityId(community.get_id());

                } catch (Exception e) {
                    generalResult = e.getMessage();
                }
                userOffline = readCurrentUser();
            }

            return null;
        }

        @Override
        protected void onPostExecute(Void result) {

            progressDialog.dismiss();

            if (generalResult == null) {
                try {
                    if (userOnline == null) throw new Exception();
                } catch (Exception e) {
                    generalResult = "No se ha actualizado la información del usuario";
                }

                String userJson = new Gson().toJson(userOnline);
                saveData(userJson, "jsonUser.txt");
                if (!userOffline.getBadge().equals(userOnline.getBadge())) {
                    updateBadge(userOnline.getBadge());
                    generalResult = "Se ha actualizado la información";
                } else {
                    generalResult = "No se ha actualizado la información del usuario";
                }
            }

        }

    }

    private void updateBadge(String newBadge) {

        android.app.AlertDialog.Builder alertDialog;
        alertDialog = new android.app.AlertDialog.Builder(MainActivity.this);
        alertDialog.setTitle("FELICITACIONES");
        alertDialog.setMessage("Ahora eres un " + newBadge);
        alertDialog.setIcon(R.drawable.trofeo);
        alertDialog.setPositiveButton("Confirmar",
                new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        finish();
                        getIntent().putExtra("updated", true);
                        startActivity(getIntent());
                    }
                });

        alertDialog.show();

    }

}
