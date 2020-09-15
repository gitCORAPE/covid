package com.cmue.umamakiapp;

import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.cmue.model.ContentCommunity;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class SeeSpecificTownActivity extends AppCompatActivity {

    private Gson gson = new GsonBuilder().disableHtmlEscaping().create();
    private ContentCommunity contentCommunity;

    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_see_specific_town);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);

        try {
            Intent intent = getIntent();
            String contentName = intent.getExtras().getString("jsonContent");
            contentCommunity = gson.fromJson(contentName, ContentCommunity.class);

        } catch (Exception e) {
            Toast.makeText(getApplicationContext(), e.toString(), Toast.LENGTH_LONG).show();
            finish();
        }

        // Profiles Nationality Information
        TextView txtCommunityName = findViewById(R.id.txtCommunityName);
        TextView txtNationalityName = findViewById(R.id.txtNationalityName);
        TextView txtRegisteredUser = findViewById(R.id.txtRegisteredUser);
        TextView txtPublications = findViewById(R.id.txtPublications);
        TextView txtPublicationsApproved = findViewById(R.id.txtPublicationsApproved);
        TextView btnContentsCommunity = findViewById(R.id.btnContentsCommunity);

        txtCommunityName.setText(contentCommunity.getName());
        txtNationalityName.setText(contentCommunity.getNationality().getName());

        String strRegisteredUsers = contentCommunity.getAssociatedUsers().toString();
        strRegisteredUsers += getString(R.string.hint_registered_user);
        txtRegisteredUser.setText(strRegisteredUsers);

        String strPublications = contentCommunity.getNumberPost().toString();
        strPublications += getString(R.string.hint_publications);
        txtPublications.setText(strPublications);

        String strPublicationsApproved = contentCommunity.getPointsApproved().toString();
        strPublicationsApproved += getString(R.string.hint_publications_approved);
        txtPublicationsApproved.setText(strPublicationsApproved);

        btnContentsCommunity.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intentSeeContent = new Intent(getApplicationContext(), SeeContentActivity.class);
                intentSeeContent.putExtra("query_filter", "?community=" + contentCommunity.get_id());
                startActivity(intentSeeContent);
            }
        });
    }


}

