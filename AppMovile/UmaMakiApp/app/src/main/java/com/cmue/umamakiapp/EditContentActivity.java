package com.cmue.umamakiapp;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.media.ExifInterface;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.VideoView;

import com.cmue.model.Community;
import com.cmue.model.Content;
import com.cmue.util.Multimedia;
import com.cmue.util.Singleton;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EditContentActivity extends AppCompatActivity {

    //Declaration values of the different options multimedia
    private int[] drawableOptionList = new int[]{
            R.drawable.icon_camera,
            R.drawable.icon_audio,
            R.drawable.icon_video
    };
    private int[] valueOptionList = new int[]{
            R.string.take_picture,
            R.string.record_audio,
            R.string.record_video
    };

    //Declaration principal widgets
    private ImageView imagePreview;
    private VideoView videoPreview;
    private ImageView imgSelectedContent;
    private TextView lblSelectedContent;
    private AutoCompleteTextView txtCommunityContent;
    private TextView btnEditContent;
    private TextView btnCancelEditContent;
    private EditText txtThemeContent;
    private EditText txtDescriptionContent;

    //Values different options multimedia
    static final int PHOTO = 1;
    static final int VIDEO = 2;
    static final int AUDIO = 3;
    static final int ERROR = 4;
    int targetW = 1;
    int targetH = 1;

    //Principal values
    private String currentPhotoPath = "";

    private Multimedia multimedia = new Multimedia();
    private Community communitySelected;
    private Community[] communityList;
    private Map<String, Community> communityMap;
    private Gson gson = new GsonBuilder().disableHtmlEscaping().create();
    private Content[] contentList;
    private int position;
    private Content content;


    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit_content);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);

        try {
            Intent intent = getIntent();
            position = intent.getExtras().getInt("position");

            if (!validateCommunities() || !validateOffline()) {
                throw new Exception();
            }

            content = contentList[position];
        } catch (Exception e) {
            Toast.makeText(getApplicationContext(),
                    R.string.error_unexpected,
                    Toast.LENGTH_LONG).show();
        }

        //Initialize the principal widgets to control view
        imgSelectedContent = findViewById(R.id.imgSelectedContent);
        lblSelectedContent = findViewById(R.id.lblSelectedContent);
        imagePreview = findViewById(R.id.imagePreview);
        videoPreview = findViewById(R.id.videoPreview);
        txtCommunityContent = findViewById(R.id.txtCommunityContent);
        btnEditContent = findViewById(R.id.btnEditContent);
        btnCancelEditContent = findViewById(R.id.btnCancelEditContent);
        txtThemeContent = findViewById(R.id.txtThemeContent);
        txtDescriptionContent = findViewById(R.id.txtDescriptionContent);

        //Initialize AutoCompleteText of community
        setAutoCompleteTextView();

        //Initialize Button Enter to send content
        setSendButton();

        //Initialize Button Cancel to reload the view
        setCancelButton();

        currentPhotoPath = content.getFile();
        if (content.getPostType().equals(getString(R.string.take_picture))) {
            loadParamsMultimedia(PHOTO);
            setResultImageInPreview();

        } else if (content.getPostType().equals(getString(R.string.record_video))) {
            loadParamsMultimedia(VIDEO);
            setResultVideoInPreview();
        }

        txtThemeContent.setText(content.getTopic());
        txtDescriptionContent.setText(content.getDescription());

    }

    /*
     * Auto Complete TextView: communities options
     * - Declaration widget
     * - Set functionality when the focus change to validate a correct community
     * */
    private void setAutoCompleteTextView() {

        txtCommunityContent.setText(content.getCommunityObject().getName());
        String[] communityItems = fillCommunityItems();

        ArrayAdapter<String> adapter = new ArrayAdapter<>(this,
                R.layout.dropdown_item,
                R.id.text_view_list_item,
                communityItems);
        txtCommunityContent.setAdapter(adapter);

        txtCommunityContent.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                selectCommunity(txtCommunityContent.getText().toString());
            }
        });

        txtCommunityContent.setOnFocusChangeListener(new View.OnFocusChangeListener() {

            @Override
            public void onFocusChange(View view, boolean b) {

                if (!b) {
                    if (!communityMap.containsKey(txtCommunityContent.getText().toString().trim().toUpperCase())) {
                        txtCommunityContent.setText("");
                        communitySelected = null;
                        Toast.makeText(getApplicationContext(),
                                getText(R.string.message_error_community),
                                Toast.LENGTH_LONG).show();
                    } else {
                        selectCommunity(txtCommunityContent.getText().toString());
                    }
                }

            }

        });

    }

    /*
     * Button Cancel: reload the activity
     * - Declaration widget, set click listener
     * - Create alertDialog to confirm de cancellation
     * */
    private void setCancelButton() {

        btnCancelEditContent.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                AlertDialog.Builder cancelDialog = new AlertDialog.Builder(EditContentActivity.this);
                cancelDialog.setTitle(getString(R.string.confirm_cancellation_edit));
                String[] cancelDialogItems = {
                        getString(R.string.accept_confirmation),
                        getString(R.string.cancel_confirmation)};
                cancelDialog.setItems(cancelDialogItems,
                        new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                if (which == 0) {
                                    finish();
                                }
                            }
                        });
                cancelDialog.show();
            }
        });

    }

    /*
     * Button Send: send content to the server
     * - Declaration widget, set click listener
     * - Validate fields are filled
     * */
    private void setSendButton() {

        btnEditContent.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                txtCommunityContent.setFocusable(true);
                txtCommunityContent.clearFocus();
                if (!communityMap.containsKey(txtCommunityContent.getText().toString().trim().toUpperCase())) {
                    txtCommunityContent.setText("");
                    communitySelected = null;
                    Toast.makeText(getApplicationContext(),
                            getText(R.string.message_error_community),
                            Toast.LENGTH_LONG).show();
                    return;
                } else {
                    selectCommunity(txtCommunityContent.getText().toString());
                }
                String theme = txtThemeContent.getText().toString().trim();
                String description = txtDescriptionContent.getText().toString().trim();
                String community = txtCommunityContent.getText().toString().trim();
                String typeContent = multimedia.getType();
                String fileContent = multimedia.getPath();

                if (!theme.equals("") && !community.equals("")
                        && !typeContent.equals("") && !fileContent.equals("")) {

                    final Content content = contentList[position];
                    content.setCommunityObject(communitySelected);
                    content.setTopic(theme);
                    content.setDescription(!description.equals("") ? description : "-");
                    content.setDate(new Date());

                    android.app.AlertDialog.Builder alertDialog;
                    alertDialog = new android.app.AlertDialog.Builder(EditContentActivity.this);
                    alertDialog.setTitle(getString(R.string.title_edit_content));
                    alertDialog.setMessage(getString(R.string.confirm_edit_content));
                    alertDialog.setNeutralButton(getString(R.string.accept_confirmation),
                            new DialogInterface.OnClickListener() {
                                public void onClick(DialogInterface dialog, int which) {

                                    contentList[position] = content;
                                    String jsonContent = gson.toJson(contentList);
                                    if (saveData(jsonContent, "jsonOffline.txt")) {
                                        Singleton.getInstance().getOfflineActivity().finish();
                                        Toast.makeText(getApplicationContext(), "Edicion exitosa", Toast.LENGTH_LONG).show();
                                        Intent intent = new Intent(getApplicationContext(), OfflineContentActivity.class);
                                        startActivity(intent);
                                        finish();
                                    } else {
                                        Toast.makeText(getApplicationContext(), "Error guardando cambios", Toast.LENGTH_LONG).show();
                                    }

                                }
                            });
                    alertDialog.setPositiveButton(getString(R.string.cancel_confirmation),
                            new DialogInterface.OnClickListener() {
                                public void onClick(DialogInterface dialog, int which) {
                                }
                            });

                    alertDialog.show();

                } else {
                    Toast.makeText(getApplicationContext(), R.string.cant_send_content,
                            Toast.LENGTH_LONG).show();
                }

            }
        });

    }


    /*----------------------------------------TAKE PICTURE----------------------------------------*/


    private static float convertDpToPixel(float dp, Context context) {

        Resources resources = context.getResources();
        DisplayMetrics metrics = resources.getDisplayMetrics();
        return dp * ((float) metrics.densityDpi / DisplayMetrics.DENSITY_DEFAULT);

    }

    private int getCameraPhotoOrientation(String imagePath) {

        int rotate = 0;

        try {
            File imageFile = new File(imagePath);

            ExifInterface exif = new ExifInterface(imageFile.getAbsolutePath());
            int orientation = exif.getAttributeInt(ExifInterface.TAG_ORIENTATION,
                    ExifInterface.ORIENTATION_NORMAL);

            switch (orientation) {
                case ExifInterface.ORIENTATION_ROTATE_270:
                    rotate = 270;
                    break;
                case ExifInterface.ORIENTATION_ROTATE_180:
                    rotate = 180;
                    break;
                case ExifInterface.ORIENTATION_ROTATE_90:
                    rotate = 90;
                    break;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rotate;

    }

    private void setResultImageInPreview() {

        File image = new File(currentPhotoPath);
        if (image.length() > 25000000L) return;

        float alto = convertDpToPixel(300, EditContentActivity.this);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, (int) alto);
        imagePreview.setLayoutParams(params);

        LinearLayout.LayoutParams paramsVideo = new LinearLayout.LayoutParams(0, 0);
        videoPreview.setLayoutParams(paramsVideo);

        if (imagePreview.getWidth() != 0 && imagePreview.getHeight() != 0) {
            targetW = imagePreview.getWidth();
            targetH = imagePreview.getHeight();
        }

        BitmapFactory.Options bmOptions = new BitmapFactory.Options();
        bmOptions.inJustDecodeBounds = true;

        int photoW = bmOptions.outWidth;
        int photoH = bmOptions.outHeight;

        int scaleFactor = Math.min(photoW / targetW, photoH / targetH);

        bmOptions.inJustDecodeBounds = false;
        bmOptions.inSampleSize = scaleFactor;
        bmOptions.inPurgeable = true;

        Bitmap bitmap = BitmapFactory.decodeFile(currentPhotoPath, bmOptions);
        imagePreview.setImageBitmap(bitmap);

        int rotation = getCameraPhotoOrientation(currentPhotoPath);
        imagePreview.setRotation(rotation);

    }

    private void loadParamsMultimedia(int option) {

        switch (option) {
            case PHOTO:
                imgSelectedContent.setImageResource(drawableOptionList[0]);
                lblSelectedContent.setText(getString(valueOptionList[0]));
                multimedia = new Multimedia(currentPhotoPath, getString(R.string.take_picture));
                break;
            case ERROR:
                currentPhotoPath = "";
                imgSelectedContent.setImageResource(R.drawable.icon_content);
                imagePreview.setImageResource(R.drawable.icon_share_preview);
                lblSelectedContent.setText("");
                float alto = convertDpToPixel(200, EditContentActivity.this);
                LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, (int) alto);
                imagePreview.setLayoutParams(params);
                LinearLayout.LayoutParams paramsVideo = new LinearLayout.LayoutParams(0, 0);
                videoPreview.setLayoutParams(paramsVideo);
                multimedia = new Multimedia();
                break;
            case VIDEO:
                imgSelectedContent.setImageResource(drawableOptionList[2]);
                lblSelectedContent.setText(getString(valueOptionList[2]));
                multimedia = new Multimedia(currentPhotoPath, getString(R.string.record_video));
                break;
        }

    }


    /*----------------------------------------RECORD VIDEO----------------------------------------*/


    private void setResultVideoInPreview() {

        File image = new File(currentPhotoPath);
        if (image.length() > 52428800L) return;

        float alto = convertDpToPixel(300, EditContentActivity.this);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(0, 0);
        imagePreview.setLayoutParams(params);
        LinearLayout.LayoutParams paramsVideo = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, (int) alto);
        videoPreview.setLayoutParams(paramsVideo);

        if (imagePreview.getWidth() != 0 && imagePreview.getHeight() != 0) {
            targetW = imagePreview.getWidth();
            targetH = imagePreview.getHeight();
        }

        videoPreview.setVideoPath(currentPhotoPath);
        videoPreview.start();

    }

    /*------------------------------------LOAD COMMUNITIES----------------------------------------*/

    public boolean validateOffline() {

        try {
            BufferedReader readToken = new BufferedReader(
                    new InputStreamReader(openFileInput("jsonOffline.txt")));
            String jOffline = readToken.readLine();
            readToken.close();
            contentList = gson.fromJson(jOffline, Content[].class);
            return true;
        } catch (Exception e) {
            contentList = new Content[]{};
            return false;
        }

    }

    /*
     * Read the information of communities from internal memory
     * */
    private boolean validateCommunities() {

        try {
            BufferedReader readToken = new BufferedReader(
                    new InputStreamReader(openFileInput("jsonCommunities.txt")));
            String jsonCommunities = readToken.readLine();
            readToken.close();
            communityList = gson.fromJson(jsonCommunities, Community[].class);
            return true;
        } catch (Exception e) {
            return false;
        }

    }

    /*
     * Fill dictionary and items with community information
     * */
    public String[] fillCommunityItems() {

        List<String> list = new ArrayList<>();
        communityMap = new HashMap<>();

        for (Community aux : communityList) {
            String key = aux.getName().toUpperCase();
            if (!communityMap.containsKey(key)) {
                communityMap.put(key, aux);
                list.add(aux.getName());
            }
        }

        String[] response = new String[list.size()];

        for (int i = 0; i < response.length; i++) {
            response[i] = list.get(i);
        }

        return response;

    }

    /*
     * Set the information of nationality and community selected
     * */
    private void selectCommunity(String textSelected) {

        Community community = communityMap.get(textSelected.trim().toUpperCase());

        if (community != null) {
            communitySelected = community;
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

}
