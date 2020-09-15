package com.cmue.umamakiapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.cmue.model.User;
import com.cmue.util.Singleton;

public class SeeSpecificUserActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_see_specific_user);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);


        final User user = Singleton.getInstance().getSpecificUser();

        TextView txtUserName = findViewById(R.id.txtUserName);
        txtUserName.setText(user.getName());

        TextView txtEmailAddress = findViewById(R.id.txtEmailAddress);
        txtEmailAddress.setText(user.getEmail());

        TextView txtCommunityNationality = findViewById(R.id.txtCommunityNationality);
        String strCommunityNationality = user.getCommunity() + " / " + user.getNationality();
        txtCommunityNationality.setText(strCommunityNationality);

        TextView txtBadgeName = findViewById(R.id.txtBadgeName);
        txtBadgeName.setText(user.getBadge().toUpperCase());

        TextView txtPublications = findViewById(R.id.txtPublications);
        String strPublications = ((int) user.getNumberPost()) + getString(R.string.hint_publications);
        txtPublications.setText(strPublications);

        TextView txtPublicationsApproved = findViewById(R.id.txtPublicationsApproved);
        String strPublicationsApproved = ((int) user.getPointsPostApproved()) + getString(R.string.hint_publications_approved);
        txtPublicationsApproved.setText(strPublicationsApproved);

        TextView txtPoints = findViewById(R.id.txtPoints);
        String strPoints = ((int) user.getPointsPost()) + getString(R.string.hint_points);
        txtPoints.setText(strPoints);

        TextView txtActions = findViewById(R.id.txtActions);
        String strActions = "";
        switch (user.getBadge().toUpperCase()) {
            case "CONOCEDOR":
                strActions = getString(R.string.txt_action_conocedor);
                break;
            case "COMPA":
                strActions = getString(R.string.txt_action_conocedor);
                strActions += "\n" + getString(R.string.txt_action_compa);
                break;
            case "COMUNICADOR":
                strActions = getString(R.string.txt_action_conocedor);
                strActions += "\n" + getString(R.string.txt_action_compa);
                strActions += "\n" + getString(R.string.txt_action_comunicador);
                break;
        }
        txtActions.setText(strActions);

        Button btnContentsUser = findViewById(R.id.btnContentsUser);
        btnContentsUser.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intentSeeContent = new Intent(getApplicationContext(), SeeContentActivity.class);
                intentSeeContent.putExtra("query_filter", "?user=" + user.get_id());
                startActivity(intentSeeContent);
            }
        });
    }
}
