package com.cmue.umamakiapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import com.cmue.model.Community;
import com.cmue.model.User;
import com.cmue.util.RestClient;
import com.cmue.util.Token;
import com.cmue.util.UtilFunctions;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import org.json.JSONObject;

import java.io.OutputStreamWriter;

public class AwaitActivityLog extends AppCompatActivity {

    //Declaration of the principal widgets
    private ProgressBar progressBar;
    private TextView lblAwaitLog;

    //Declaration of the general data
    private String jsonUser = "";
    private String jsonCommunities = "";
    private String emailText = "";
    private String IMEI = "";
    private Gson gson = new GsonBuilder().disableHtmlEscaping().create();
    private int comeFrom = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_await_log);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);

        try {
            Intent intent = getIntent();

            comeFrom = intent.getExtras().getInt(getString(R.string.intent_type_process_login));
            jsonUser = intent.getExtras().getString(getString(R.string.intent_user_information));

            User aux_user = gson.fromJson(jsonUser, User.class);
            IMEI = intent.getExtras().getString(getString(R.string.intent_IMEI));
            emailText = aux_user.getEmail();
        } catch (Exception e) {
            if (comeFrom == 1 || comeFrom == 3) {
                Intent intentEmail = new Intent(getApplicationContext(), EmailActivity.class);
                startActivity(intentEmail);
                finish();
            }
        }

        progressBar = findViewById(R.id.prbrLogIn);
        lblAwaitLog = findViewById(R.id.lblAwaitLog);

        switch (comeFrom) {
            case 1:
                new AsyncTaskVerifyEmail().execute();
                break;
            case 2:
                new AsyncTaskSingIn().execute();
                break;
        }

    }

    private boolean saveData(String jsonData, String jsonName) {

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


    private class AsyncTaskVerifyEmail extends AsyncTask<Void, Integer, Void> {

        private String generalResult;

        @Override
        protected void onPreExecute() {

            progressBar.setVisibility(View.VISIBLE);
            Drawable progressDrawable = progressBar.getIndeterminateDrawable().mutate();
            progressDrawable.setColorFilter(getResources().getColor(R.color.colorProgressBar),
                    PorterDuff.Mode.SRC_IN);
            progressBar.setProgressDrawable(progressDrawable);
            lblAwaitLog.setText(getString(R.string.cheking_email));

        }

        @Override
        protected Void doInBackground(Void... voids) {

            RestClient restClient = new RestClient();

            generalResult = null;
            String resultJson = "";

            try {
                String resultCommunities = restClient.eventGet("communities/");

                Community[] communitiesList = gson.fromJson(resultCommunities, Community[].class);
                jsonCommunities = gson.toJson(communitiesList);

                JSONObject sampleObject = new JSONObject();
                sampleObject.put("email", emailText);
                sampleObject.put("imei", IMEI);

                resultJson = restClient.eventPost("users/tokens", sampleObject.toString());
                Token token = gson.fromJson(resultJson, Token.class);

                String resultUser = restClient.eventGet("users/" + emailText);
                User user = gson.fromJson(resultUser, User.class);
                user.setEmail(emailText);
                jsonUser = gson.toJson(user);
            } catch (Exception e) {
                generalResult = e.getMessage();
            }
            if (resultJson.equals(getString(R.string.no_user_found)) ||
                    resultJson.equals(getString(R.string.user_not_found))) {
                generalResult = getString(R.string.new_user);
            } else if (resultJson.equals(getString(R.string.imei_not_register))) {
                generalResult = getString(R.string.imei_changed);
            }

            return null;

        }

        @Override
        protected void onPostExecute(Void result) {

            progressBar.setVisibility(View.GONE);

            if (generalResult == null && !saveData(jsonUser,
                    getString(R.string.intent_user_information) + ".txt")) {
                generalResult = getString(R.string.error_saving_data);
            }

            if (!saveData(jsonCommunities,
                    getString(R.string.intent_communities_information) + ".txt")) {
                generalResult = getString(R.string.error_saving_data_communities);
            }

            if (generalResult != null) {
                Toast.makeText(getApplicationContext(), generalResult, Toast.LENGTH_LONG).show();
            }

            if (generalResult == null) {
                //All it's ok, go to main activity saving user and token data
                Intent intentMain = new Intent(getApplicationContext(), EmailActivity.class);
                intentMain.putExtra(getString(R.string.intent_email_text), "");
                startActivity(intentMain);
            } else if (generalResult.equals(getString(R.string.new_user))) {
                //go to register
                Intent intentSingIn = new Intent(getApplicationContext(), SingInActivity.class);
                intentSingIn.putExtra(getString(R.string.intent_user_information), jsonUser);
                intentSingIn.putExtra(getString(R.string.intent_IMEI), IMEI);
                startActivity(intentSingIn);
            } else if (generalResult.equals(getString(R.string.imei_changed))) {
                //The user isn't enabled, go to verification user process
                Intent intentVerificationProcess = new Intent(getApplicationContext(), VerificationActivity.class);
                intentVerificationProcess.putExtra(getString(R.string.intent_user_information), jsonUser);
                intentVerificationProcess.putExtra(getString(R.string.intent_type_process_login), 2);
                intentVerificationProcess.putExtra(getString(R.string.intent_IMEI), IMEI);
                startActivity(intentVerificationProcess);
            } else {
                //An error, return to Email Activity
                Intent intentEmail = new Intent(getApplicationContext(), EmailActivity.class);
                intentEmail.putExtra(getString(R.string.intent_email_text), emailText);
                startActivity(intentEmail);
            }

            finish();

        }

    }

    private class AsyncTaskSingIn extends AsyncTask<Void, Integer, Void> {

        private String generalResult;

        @Override
        protected void onPreExecute() {

            progressBar.setVisibility(View.VISIBLE);
            Drawable progressDrawable = progressBar.getIndeterminateDrawable().mutate();
            progressDrawable.setColorFilter(getResources().getColor(R.color.colorProgressBar),
                    PorterDuff.Mode.SRC_IN);
            progressBar.setProgressDrawable(progressDrawable);
            lblAwaitLog.setText(getString(R.string.singin_user));

        }

        @Override
        protected Void doInBackground(Void... voids) {


            RestClient restClient = new RestClient();

            generalResult = UtilFunctions.validateOnlineNetServices();

            if (generalResult == null) {
                try {
                    User user = gson.fromJson(jsonUser, User.class);

                    JSONObject sampleObject = new JSONObject();
                    sampleObject.put("email", emailText);
                    sampleObject.put("name", user.getName());
                    sampleObject.put("imei", IMEI);
                    sampleObject.put("nationality", user.getNationality());
                    sampleObject.put("community", user.getCommunity());

                    String resultLogIn = restClient.eventPost("users", sampleObject.toString());
                    user = gson.fromJson(resultLogIn, User.class);
                    jsonUser = gson.toJson(user);
                } catch (Exception e) {
                    generalResult = getString(R.string.error_unexpected);
                }
            }

            return null;

        }

        @Override
        protected void onPostExecute(Void result) {

            progressBar.setVisibility(View.GONE);

            if (generalResult == null && !saveData(jsonUser, getString(R.string.intent_user_information) + ".txt")) {
                generalResult = getString(R.string.error_saving_data);
            }

            if (generalResult == null) {
                //All it's ok, go to verification process
                Intent intentVerificationProcess = new Intent(getApplicationContext(), VerificationActivity.class);
                intentVerificationProcess.putExtra(getString(R.string.intent_user_information), jsonUser);
                intentVerificationProcess.putExtra(getString(R.string.intent_type_process_login), 1);
                intentVerificationProcess.putExtra(getString(R.string.intent_IMEI), IMEI);
                startActivity(intentVerificationProcess);
                finish();
            } else {
                //An error, return to Email Activity
                Toast.makeText(getApplicationContext(), generalResult, Toast.LENGTH_LONG).show();

                Intent intentSingIn = new Intent(getApplicationContext(), SingInActivity.class);
                intentSingIn.putExtra(getString(R.string.intent_user_information), jsonUser);
                intentSingIn.putExtra(getString(R.string.intent_IMEI), IMEI);
                startActivity(intentSingIn);
                finish();
            }

        }

    }

}
