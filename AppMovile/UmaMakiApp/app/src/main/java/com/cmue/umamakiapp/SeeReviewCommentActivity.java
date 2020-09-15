package com.cmue.umamakiapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.os.Bundle;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.cmue.util.CustomAdapterReview;
import com.cmue.util.Singleton;

public class SeeReviewCommentActivity extends AppCompatActivity {

    private ListView lstReviewComment;
    private LinearLayout layoutSeeMore;
    private TextView btnSeeMore;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_see_review_comment);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);

        try{
            Intent intent = getIntent();
            String type = intent.getExtras().getString("type");
            buildWidgets();
            boolean isReview = type.equals("review");
            initWidgets(isReview);
            if(isReview){
                CustomAdapterReview customAdapter = new CustomAdapterReview(
                        SeeReviewCommentActivity.this,
                        Singleton.getInstance().getContentPost().getReviews());
                lstReviewComment.setAdapter(customAdapter);
            }

        }catch (Exception e){
            Toast.makeText(getApplicationContext(),
                    getString(R.string.error_unexpected),
                    Toast.LENGTH_LONG).show();
            finish();
        }

    }

    private void buildWidgets(){

        lstReviewComment =  findViewById(R.id.lstReviewComment);
        layoutSeeMore =  findViewById(R.id.layoutSeeMore);
        btnSeeMore =  findViewById(R.id.btnSeeMore);

    }

    private void initWidgets(boolean isReview){

        if(isReview){
            layoutSeeMore.setVisibility(View.GONE);
        }

    }

}
