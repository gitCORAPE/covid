package com.cmue.umamakiapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.widget.ImageView;
import android.widget.Toast;

import java.io.File;

public class SeeImageContentActivity extends AppCompatActivity {

    private String path;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_see_image_content);

        try {
            Intent intent = getIntent();
            path = intent.getExtras().getString("path");
        } catch (Exception e) {
            Toast.makeText(getApplicationContext(), e.toString(), Toast.LENGTH_LONG).show();
            finish();
        }

        ImageView imgDisplay = findViewById(R.id.imgDisplay);

        imgDisplay.setImageURI(Uri.fromFile(new File(path)));

    }

}
