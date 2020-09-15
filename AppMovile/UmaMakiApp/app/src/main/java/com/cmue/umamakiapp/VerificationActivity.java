package com.cmue.umamakiapp;

import androidx.appcompat.app.AppCompatActivity;

import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.cmue.model.User;
import com.cmue.util.RestClient;
import com.cmue.util.UtilFunctions;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import org.json.JSONObject;

import java.io.OutputStreamWriter;

public class VerificationActivity extends AppCompatActivity {

    int comeFrom = 0;
    String jsonUser = "";
    Gson gson = new GsonBuilder().disableHtmlEscaping().create();
    String IMEI = "";

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_verification);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);

        Intent intent = getIntent();
        try {
            comeFrom = intent.getExtras().getInt(getString(R.string.intent_type_process_login));
            jsonUser = intent.getExtras().getString(getString(R.string.intent_user_information));
            User aux_user = gson.fromJson(jsonUser, User.class);
            IMEI = intent.getExtras().getString(getString(R.string.intent_IMEI));
        } catch (Exception e) {
            Log.e("Error Verification", e.toString());
        }

        TextView label_text_verification = findViewById(R.id.label_text_verification);
        switch (comeFrom) {
            case 1:
                label_text_verification.setText(R.string.label_message_verify_account);
                break;
            case 2:
                label_text_verification.setText(R.string.label_message_verify_change);
                break;
            case 0:
                label_text_verification.setText("");
                break;
        }

        TextView btn_verificated = findViewById(R.id.btn_verificated);
        btn_verificated.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                new AsyncTask_Verification().execute();
            }
        });

        TextView btn_resend_mail = findViewById(R.id.btn_resend_mail);
        btn_resend_mail.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                new AsyncTaskResendEmail().execute();
            }
        });

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

    private class AsyncTask_Verification extends AsyncTask<Void, Integer, Void> {

        private String general_result;
        ProgressDialog progressDialog;
        private AlertDialog.Builder alertDialog;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();

            alertDialog = new AlertDialog.Builder(VerificationActivity.this);
            progressDialog = ProgressDialog.show(
                    VerificationActivity.this, "Por favor espere", "Procesando...");
        }

        @Override
        protected Void doInBackground(Void... voids) {
            Gson gson = new GsonBuilder().disableHtmlEscaping().create();
            RestClient restClient = new RestClient();

            general_result = UtilFunctions.validateOnlineNetServices();

            if (general_result == null) {
                String result_login;
                User user = gson.fromJson(jsonUser, User.class);
                try {
                    User aux_user;
                    result_login = restClient.eventGet("users/" + user.getEmail());
                    aux_user = gson.fromJson(result_login, User.class);
                    if (aux_user.getStatus().equals(getString(R.string.is_user_enabled)) &&
                            aux_user.getImei().equals(IMEI)) {
                        jsonUser = gson.toJson(aux_user);
                    } else {
                        general_result = getString(R.string.message_user_not_enabled);
                    }
                } catch (Exception e) {
                    general_result = getString(R.string.error_unexpected);
                }
            }
            return null;
        }

        @Override
        protected void onPostExecute(Void result) {

            progressDialog.dismiss();

            if (general_result == null && !saveData(jsonUser, getString(R.string.intent_user_information) + ".txt")) {
                general_result = getString(R.string.error_saving_data);
            }

            if (general_result != null) {
                Toast.makeText(getApplicationContext(), general_result, Toast.LENGTH_LONG).show();
            }

            if (general_result == null) {
                Intent go_mainActivity = new Intent(getApplicationContext(), MainActivity.class);
                go_mainActivity.putExtra(getString(R.string.intent_user_information), jsonUser);
                startActivity(go_mainActivity);
                finish();
            }
        }
    }


    private class AsyncTaskResendEmail extends AsyncTask<Void, Integer, Void> {

        private String general_result;
        ProgressDialog progressDialog;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();

            progressDialog = ProgressDialog.show(
                    VerificationActivity.this, "Por favor espere", "Procesando...");
        }

        @Override
        protected Void doInBackground(Void... voids) {

            Gson gson = new GsonBuilder().disableHtmlEscaping().create();
            RestClient restClient = new RestClient();

            general_result = UtilFunctions.validateOnlineNetServices();

            if (general_result == null) {
                String resultResend;
                User user = gson.fromJson(jsonUser, User.class);
                try {
                    JSONObject sampleObject = new JSONObject();
                    sampleObject.put("mail", user.getEmail());

                    resultResend = restClient.eventPut("users/activate/resend", sampleObject.toString());
                    if (resultResend == null) {
                        throw new Exception();
                    }
                } catch (Exception e) {
                    general_result = getString(R.string.error_unexpected);
                }
            }
            return null;

        }

        @Override
        protected void onPostExecute(Void result) {

            progressDialog.dismiss();

            if (general_result != null) {
                Toast.makeText(getApplicationContext(), general_result, Toast.LENGTH_LONG).show();
            } else {
                Toast.makeText(getApplicationContext(), "El correo se ha reenviado, verificalo", Toast.LENGTH_LONG).show();
            }

        }

    }

}
