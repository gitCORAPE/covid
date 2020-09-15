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
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

import com.cmue.model.ContentPost;
import com.cmue.model.PageContent;
import com.cmue.model.User;
import com.cmue.util.CustomAdapterContent;
import com.cmue.util.RestClient;
import com.cmue.util.Singleton;
import com.cmue.util.UtilFunctions;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class SeeContentActivity extends AppCompatActivity {

    private int page = 1;
    private int auxPage = 0;
    private int totalPage = 1;
    private ImageView btnReturnPage;
    private ImageView btnNextPage;
    private TextView txtCounterPage;
    private ListView lstContent;
    private User user;
    private Gson gson = new GsonBuilder().disableHtmlEscaping().create();

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_see_content);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);

        user = Singleton.getInstance().getCurrentUser();

        btnReturnPage = findViewById(R.id.btnReturnPage);
        btnNextPage = findViewById(R.id.btnNextPage);
        txtCounterPage = findViewById(R.id.txtCounterPage);
        lstContent = findViewById(R.id.lstContent);

        btnReturnPage.setVisibility(View.INVISIBLE);
        btnNextPage.setVisibility(View.INVISIBLE);

        btnReturnPage.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                auxPage = page;
                page--;
                new AsyncTaskGetContent().execute();
            }
        });

        btnNextPage.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                auxPage = page;
                page++;
                new AsyncTaskGetContent().execute();
            }
        });

        new AsyncTaskGetContent().execute();

    }

    private class AsyncTaskGetContent extends AsyncTask<Void, Integer, Void> {

        private String generalResult;
        private ProgressDialog progressDialog;
        private PageContent pageContent;

        @Override
        protected void onPreExecute() {
            progressDialog = ProgressDialog.show(
                    SeeContentActivity.this, "Por favor espere", "Procesando...");
        }

        @Override
        protected Void doInBackground(Void... voids) {

            RestClient restClient = new RestClient();

            generalResult = UtilFunctions.validateOnlineNetServices();

            if (generalResult == null) {
                pageContent = null;
                String uri = "contentPosts/page/" + (page - 1);

                try {
                    Intent intent = getIntent();
                    String queryFilter = intent.getExtras().getString("query_filter");
                    if (queryFilter == null) throw new Exception();
                    uri += queryFilter;
                } catch (Exception e) {
                    Log.e("Error see content", e.toString());
                }

                try {
                    String resultPage = restClient.eventGet(uri);
                    pageContent = gson.fromJson(resultPage, PageContent.class);
                } catch (Exception e) {
                    pageContent = null;
                    //general_result = getString(R.string.error_unexpected);
                    generalResult = e.getMessage();
                }
            }

            return null;

        }

        @Override
        protected void onPostExecute(Void result) {

            progressDialog.dismiss();
            ContentPost[] contentPosts = null;

            if (generalResult == null) {
                try {
                    contentPosts = pageContent.getContentPosts();
                    if (contentPosts.length == 0) throw new Exception();
                } catch (Exception e) {
                    generalResult = "No hay contenidos para ver";
                    page = auxPage;
                }
            }

            if (generalResult == null) {
                totalPage = pageContent.getTotalPages();
                page = pageContent.getPageNumber();
                txtCounterPage.setText(page + "");

                setOptionsDisplayInformation();

                CustomAdapterContent customAdapter = new CustomAdapterContent(SeeContentActivity.this, contentPosts, user);
                lstContent.setAdapter(customAdapter);
            } else {
                AlertDialog.Builder alertDialog = new AlertDialog.Builder(SeeContentActivity.this);
                alertDialog.setTitle(getString(R.string.title_content));
                alertDialog.setCancelable(false);
                alertDialog.setMessage(generalResult);
                alertDialog.setNeutralButton(getString(R.string.btn_accept_offline_content),
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {
                                if(page == 1){
                                    finish();
                                }
                            }
                        });
                alertDialog.show();
            }

        }

        private void setOptionsDisplayInformation() {

            if (totalPage == 1) {
                btnReturnPage.setVisibility(View.INVISIBLE);
                btnNextPage.setVisibility(View.INVISIBLE);
            } else if (page >= totalPage) {
                btnReturnPage.setVisibility(View.VISIBLE);
                btnNextPage.setVisibility(View.INVISIBLE);
            } else if (page <= 1) {
                btnReturnPage.setVisibility(View.INVISIBLE);
                btnNextPage.setVisibility(View.VISIBLE);
            } else {
                btnReturnPage.setVisibility(View.VISIBLE);
                btnNextPage.setVisibility(View.VISIBLE);
            }

        }

    }

}
