package com.cmue.umamakiapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

public class SeeAudioContentActivity extends AppCompatActivity {

    private String path;
    private MediaPlayer mediaPlayer;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_see_audio_content);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);

        TextView labelAudioPath = findViewById(R.id.labelAudioPath);

        try {
            Intent intent = getIntent();
            path = intent.getExtras().getString("path");
            String[] name = path.split("/");
            labelAudioPath.setText(getText(R.string.txt_name_audio) + name[name.length - 1]);
        } catch (Exception e) {
            Toast.makeText(getApplicationContext(), e.toString(), Toast.LENGTH_LONG).show();
            finish();
        }

    }

    public void play(View v) {

        if (mediaPlayer == null) {
            mediaPlayer = MediaPlayer.create(SeeAudioContentActivity.this, Uri.parse(path));
            mediaPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
                @Override
                public void onCompletion(MediaPlayer mediaPlayer) {
                    stopPlayer();
                }
            });
        }
        mediaPlayer.start();

    }

    public void pause(View v) {

        if (mediaPlayer != null) {
            mediaPlayer.pause();
        }

    }

    public void stop(View v) {
        stopPlayer();
    }

    private void stopPlayer() {

        if (mediaPlayer != null) {
            mediaPlayer.release();
            mediaPlayer = null;
        }

    }

    @Override
    protected void onStop() {

        super.onStop();
        stopPlayer();

    }

}
