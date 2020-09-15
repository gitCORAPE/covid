package com.cmue.umamakiapp;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import android.Manifest;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.provider.Settings;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.cmue.model.User;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class EmailActivity extends AppCompatActivity {

    //Declaration principal variables
    private String jsonUser = "";
    private String emailText = "";
    private Gson gson = new GsonBuilder().disableHtmlEscaping().create();

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_email);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);

        //Set the permission to read and write information
        setReadWritePermission();

        //Get email info from others activities
        try {
            Intent intent = getIntent();
            emailText = intent.getExtras().getString(getString(R.string.intent_email_text));
        } catch (Exception e) {
            Log.e("Error Email", e.toString());
        }

        //Validate the login. Is there user information login?
        boolean isValidated = validateLogIn();

        //If there is user information login and is the first time, validate
        //if the user is enabled or not
        if (isValidated && emailText.equals("")) {
            User user = gson.fromJson(jsonUser, User.class);
            String statusUser = user.getStatus() != null ? user.getStatus() : "";
            if (statusUser.equals(getString(R.string.is_user_enabled))) {
                //The user is enabled, go to the main activity
                Intent intentMain = new Intent(getApplicationContext(), MainActivity.class);
                intentMain.putExtra(getString(R.string.intent_user_information), jsonUser);
                startActivity(intentMain);
                finish();
            } else {
                //The user isn't enabled, go to verification user process
                Intent intentVerificationProcess = new Intent(getApplicationContext(), VerificationActivity.class);
                intentVerificationProcess.putExtra(getString(R.string.intent_user_information), jsonUser);
                intentVerificationProcess.putExtra(getString(R.string.intent_type_process_login), 1);
                intentVerificationProcess.putExtra(getString(R.string.intent_IMEI), getIMEI());
                startActivity(intentVerificationProcess);
                finish();
            }
        }


        /*
         * If there isn't information login, make mail entry process
         * */

        //Declaration widget editText entry email address, and set information default
        final EditText txtEmailAddress = findViewById(R.id.txtEmailAddress);
        txtEmailAddress.setText(emailText.trim());

        //Declaration button to enter and commit the email address to verification
        TextView btnEnter = findViewById(R.id.btnEnter);
        btnEnter.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                String emailInput = txtEmailAddress.getText().toString().trim();
                if (emailInput.equals("")) {
                    //The email entry is empty
                    Toast.makeText(getApplicationContext(),
                            R.string.message_error_email,
                            Toast.LENGTH_SHORT).show();
                } else if (!getIMEI().equals("")) {
                    //There is a email, go to verification email process
                    User newUser = new User();
                    newUser.setEmail(emailInput);
                    Intent intentSingIn = new Intent(getApplicationContext(), AwaitActivityLog.class);
                    intentSingIn.putExtra(getString(R.string.intent_user_information), gson.toJson(newUser));
                    intentSingIn.putExtra(getString(R.string.intent_type_process_login), 1);
                    intentSingIn.putExtra(getString(R.string.intent_IMEI), getIMEI());
                    startActivity(intentSingIn);
                    finish();
                } else {
                    //The IMEI returns empty, an error
                    Toast.makeText(getApplicationContext(),
                            R.string.message_error_IMEI,
                            Toast.LENGTH_SHORT).show();
                }

            }
        });

    }

    /*
     * Set the permission for read and write plain text
     * and device information
     * */
    public void setReadWritePermission() {

        int permissionCheck = ContextCompat.checkSelfPermission(
                this, Manifest.permission.READ_PHONE_STATE);

        if (permissionCheck != PackageManager.PERMISSION_GRANTED) {
            Log.i("Message Error", "No permission set");
            ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.READ_PHONE_STATE}, 225);
        } else {
            Log.i("Message Error", "Permission conceded!");
        }

    }

    /*
     * Get IMEI,unique identifier of a mobile phone
     * */
    public String getIMEI() {

        try {
            return Settings.Secure.getString(getApplicationContext().getContentResolver(), Settings.Secure.ANDROID_ID);
        } catch (Exception e) {
            return "";
        }

    }

    /*
     * Read the information for login from internal memory
     * */
    public boolean validateLogIn() {

        try {
            BufferedReader readToken = new BufferedReader(
                    new InputStreamReader(openFileInput(getString(R.string.intent_user_information) + ".txt")));
            String jUser = readToken.readLine();
            readToken.close();
            User user = gson.fromJson(jUser, User.class);
            jsonUser = gson.toJson(user);
            return true;
        } catch (Exception e) {
            return false;
        }

    }

}
