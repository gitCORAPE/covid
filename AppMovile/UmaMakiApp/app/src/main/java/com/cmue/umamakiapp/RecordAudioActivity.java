package com.cmue.umamakiapp;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.res.ColorStateList;
import android.media.MediaPlayer;
import android.media.MediaRecorder;
import android.os.Bundle;
import android.os.Environment;
import android.util.Log;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import static android.Manifest.permission.RECORD_AUDIO;
import static android.Manifest.permission.WRITE_EXTERNAL_STORAGE;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class RecordAudioActivity extends AppCompatActivity {

    private TextView btnRecord, btnStop, btnPlay, btnAccept, labelAudioPath;
    private MediaRecorder mRecorder;
    private MediaPlayer mPlayer;
    private static final String LOG_TAG = "AudioRecording";
    private static String mFileName = null;
    private static final int REQUEST_AUDIO_PERMISSION_CODE = 1;
    private String currentPhotoPath = "";


    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_record_audio);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);

        btnRecord = findViewById(R.id.btnRecord);
        btnStop = findViewById(R.id.btnStop);
        btnPlay = findViewById(R.id.btnPlay);
        btnAccept = findViewById(R.id.btnAccept);
        labelAudioPath = findViewById(R.id.labelAudioPath);

        btnStop.setEnabled(false);
        btnPlay.setEnabled(false);
        btnStop.setBackgroundTintList(ColorStateList.valueOf(getResources().getColor(R.color.colorHintEditText)));
        btnPlay.setBackgroundTintList(ColorStateList.valueOf(getResources().getColor(R.color.colorHintEditText)));
        btnAccept.setEnabled(false);
        btnAccept.setBackgroundTintList(ColorStateList.valueOf(getResources().getColor(R.color.colorHintEditText)));

        btnAccept.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent _result = new Intent();
                _result.putExtra("path", currentPhotoPath);
                setResult(Activity.RESULT_OK, _result);
                finish();
            }
        });

        btnRecord.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if (CheckPermissions()) {
                    try {
                        createAudioFile();
                        mFileName = currentPhotoPath;
                    } catch (IOException e) {
                        Toast.makeText(getApplicationContext(), "Error generando archivo de audio", Toast.LENGTH_LONG).show();
                        return;
                    }

                    labelAudioPath.setText(R.string.txt_name_audio);
                    btnStop.setEnabled(true);
                    btnStop.setBackgroundTintList(ColorStateList.valueOf(getResources().getColor(R.color.colorTextButton)));
                    btnRecord.setEnabled(false);
                    btnPlay.setEnabled(false);
                    btnRecord.setBackgroundTintList(ColorStateList.valueOf(getResources().getColor(R.color.colorHintEditText)));
                    btnPlay.setBackgroundTintList(ColorStateList.valueOf(getResources().getColor(R.color.colorHintEditText)));
                    btnAccept.setEnabled(false);
                    btnAccept.setBackgroundTintList(ColorStateList.valueOf(getResources().getColor(R.color.colorHintEditText)));
                    mRecorder = new MediaRecorder();
                    mRecorder.setAudioSource(MediaRecorder.AudioSource.MIC);
                    mRecorder.setOutputFormat(MediaRecorder.OutputFormat.THREE_GPP);
                    mRecorder.setAudioEncoder(MediaRecorder.AudioEncoder.AMR_NB);
                    mRecorder.setOutputFile(mFileName);

                    try {
                        mRecorder.prepare();
                    } catch (IOException e) {
                        Log.e(LOG_TAG, "prepare() failed");
                    }

                    mRecorder.start();
                    Toast.makeText(getApplicationContext(), "Grabación empezada", Toast.LENGTH_LONG).show();
                } else {
                    RequestPermissions();
                }

            }
        });

        btnStop.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                btnStop.setEnabled(false);
                btnRecord.setEnabled(true);
                btnPlay.setEnabled(true);

                btnStop.setBackgroundTintList(ColorStateList.valueOf(getResources().getColor(R.color.colorHintEditText)));
                btnRecord.setBackgroundTintList(ColorStateList.valueOf(getResources().getColor(R.color.colorTextButton)));
                btnPlay.setBackgroundTintList(ColorStateList.valueOf(getResources().getColor(R.color.colorTextButton)));

                btnAccept.setEnabled(true);
                btnAccept.setBackgroundTintList(ColorStateList.valueOf(getResources().getColor(R.color.colorTextButton)));
                mRecorder.stop();
                mRecorder.release();

                mRecorder = null;
                String[] name = currentPhotoPath.split("/");
                labelAudioPath.setText(getString(R.string.txt_name_audio) + name[name.length - 1]);
                Toast.makeText(getApplicationContext(), "Grabación Detenida", Toast.LENGTH_LONG).show();

            }
        });

        btnPlay.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                btnStop.setEnabled(false);
                btnRecord.setEnabled(true);
                btnPlay.setEnabled(false);

                btnStop.setBackgroundTintList(ColorStateList.valueOf(getResources().getColor(R.color.colorHintEditText)));
                btnRecord.setBackgroundTintList(ColorStateList.valueOf(getResources().getColor(R.color.colorTextButton)));
                btnPlay.setBackgroundTintList(ColorStateList.valueOf(getResources().getColor(R.color.colorHintEditText)));

                btnAccept.setEnabled(true);
                btnAccept.setBackgroundTintList(ColorStateList.valueOf(getResources().getColor(R.color.colorTextButton)));

                mPlayer = new MediaPlayer();

                try {
                    mPlayer.setDataSource(mFileName);
                    mPlayer.prepare();
                    mPlayer.start();
                    Toast.makeText(getApplicationContext(), "Reproduciendo audio", Toast.LENGTH_LONG).show();
                } catch (IOException e) {
                    Log.e(LOG_TAG, "prepare() failed");
                }

            }
        });

    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {

        if (requestCode == REQUEST_AUDIO_PERMISSION_CODE) {
            if (grantResults.length > 0) {
                boolean permissionToRecord = grantResults[0] == PackageManager.PERMISSION_GRANTED;
                boolean permissionToStore = grantResults[1] == PackageManager.PERMISSION_GRANTED;
                if (permissionToRecord && permissionToStore) {
                    Toast.makeText(getApplicationContext(), "Permission Granted", Toast.LENGTH_LONG).show();
                } else {
                    Toast.makeText(getApplicationContext(), "Permission Denied", Toast.LENGTH_LONG).show();
                }
            }
        }

    }

    public boolean CheckPermissions() {

        int result = ContextCompat.checkSelfPermission(getApplicationContext(), WRITE_EXTERNAL_STORAGE);
        int result1 = ContextCompat.checkSelfPermission(getApplicationContext(), RECORD_AUDIO);
        return result == PackageManager.PERMISSION_GRANTED && result1 == PackageManager.PERMISSION_GRANTED;

    }

    private void RequestPermissions() {

        ActivityCompat.requestPermissions(RecordAudioActivity.this,
                new String[]{RECORD_AUDIO, WRITE_EXTERNAL_STORAGE},
                REQUEST_AUDIO_PERMISSION_CODE);

    }

    private void createAudioFile() throws IOException {

        String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
        String imageFileName = "MP3_" + timeStamp + "_";
        File storageDir = getExternalFilesDir(Environment.DIRECTORY_PODCASTS);
        File image = File.createTempFile(
                imageFileName,  /* prefix */
                ".mp3",         /* suffix */
                storageDir      /* directory */
        );

        currentPhotoPath = image.getAbsolutePath();

    }

}
