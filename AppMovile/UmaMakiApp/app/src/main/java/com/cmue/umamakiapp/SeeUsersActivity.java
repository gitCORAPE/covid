package com.cmue.umamakiapp;

import androidx.appcompat.app.AppCompatActivity;

import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

import com.cmue.model.User;
import com.cmue.util.CustomAdapterUser;
import com.cmue.util.RestClient;
import com.cmue.util.UtilFunctions;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class SeeUsersActivity extends AppCompatActivity {

    private int page = 1;
    private int totalPage = 1;
    private ImageView btn_return_page;
    private ImageView btn_next_page;
    private TextView txt_counter_page;
    private ListView lst_user;
    private ImageView btnUserSearch;
    private EditText txtUserSearch;
    private boolean firstQuery = true;
    String queryFilter = "";

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_see_user);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);

        btn_return_page = findViewById(R.id.btnReturnPage);
        btn_next_page = findViewById(R.id.btnNextPage);
        txt_counter_page = findViewById(R.id.txtCounterPage);
        lst_user = findViewById(R.id.lstContent);
        btnUserSearch = findViewById(R.id.btnUserSearch);
        txtUserSearch = findViewById(R.id.txtUserSearch);

        btn_return_page.setVisibility(View.INVISIBLE);
        btn_next_page.setVisibility(View.INVISIBLE);

        try {
            Intent intent = getIntent();
            String strUserName = intent.getExtras().getString("txtUserName");
            txtUserSearch.setText(strUserName);

        } catch (Exception e) {
            Log.e("Error Find User", e.toString());
        }

        btn_return_page.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                page--;
                new AsyncTaskGetUsers().execute();
            }
        });
        btn_next_page.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                page++;
                new AsyncTaskGetUsers().execute();
            }
        });

        String strUserName = txtUserSearch.getText().toString();
        if (!strUserName.equals("")) {
            //queryFilter = "?user=" + strUserName;
            queryFilter = strUserName;
        }


        btnUserSearch.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String strUserName = txtUserSearch.getText().toString();
                Intent intentSeeUser = new Intent(getApplicationContext(), SeeUsersActivity.class);
                intentSeeUser.putExtra("txtUserName", strUserName);
                startActivity(intentSeeUser);
                finish();
            }
        });


        new AsyncTaskGetUsers().execute();
    }

    private class AsyncTaskGetUsers extends AsyncTask<Void, Integer, Void> {

        private String generalResult;
        private ProgressDialog progressDialog;
        private User[] userList;

        @Override
        protected void onPreExecute() {
            progressDialog = ProgressDialog.show(
                    SeeUsersActivity.this, "Por favor espere", "Procesando...");
        }

        @Override
        protected Void doInBackground(Void... voids) {

            Gson gson = new GsonBuilder().disableHtmlEscaping().create();
            RestClient restClient = new RestClient();

            generalResult = UtilFunctions.validateOnlineNetServices();

            if (generalResult == null) {
                userList = null;

                //String uri = "users/page/" + (page - 1) + queryFilter;
                String uri = "users/" + queryFilter + "/page/" + (page - 1);

                try {
                    String resultPage = restClient.eventGet(uri);
                    userList = gson.fromJson(resultPage, User[].class);
                } catch (Exception e) {
                    userList = null;
                    generalResult = e.getMessage();
                }
            }

            return null;

        }

        @Override
        protected void onPostExecute(Void result) {

            progressDialog.dismiss();

            if (generalResult == null) {
                try {
                    if (userList.length == 0) throw new Exception();
                } catch (Exception e) {
                    generalResult = "No hay usuarios para ver";
                    totalPage = --page;
                    setOptionsDisplayInformation();
                }
            }

            if (generalResult == null) {
                txt_counter_page.setText(page + "");
                firstQuery = false;
                totalPage = page + 1;
                setOptionsDisplayInformation();

                CustomAdapterUser customAdapter = new CustomAdapterUser(SeeUsersActivity.this, userList);
                lst_user.setAdapter(customAdapter);
            } else {
                AlertDialog.Builder alertDialog = new AlertDialog.Builder(SeeUsersActivity.this);
                alertDialog.setTitle(getString(R.string.title_content));
                alertDialog.setCancelable(false);
                alertDialog.setMessage(generalResult);
                alertDialog.setNeutralButton(getString(R.string.btn_accept_offline_content),
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {
                                /*if (firstQuery) {
                                    finish();
                                }*/
                            }
                        });

                alertDialog.show();
            }

        }

        private void setOptionsDisplayInformation() {

            if (totalPage == 1) {
                btn_return_page.setVisibility(View.INVISIBLE);
                btn_next_page.setVisibility(View.INVISIBLE);
            } else if (page >= totalPage) {
                btn_return_page.setVisibility(View.VISIBLE);
                btn_next_page.setVisibility(View.INVISIBLE);
            } else if (page <= 1) {
                btn_return_page.setVisibility(View.INVISIBLE);
                btn_next_page.setVisibility(View.VISIBLE);
            } else {
                btn_return_page.setVisibility(View.VISIBLE);
                btn_next_page.setVisibility(View.VISIBLE);
            }

        }

    }

}
