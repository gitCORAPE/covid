package com.cmue.umamakiapp;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.FileProvider;

import android.Manifest;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.Rect;
import android.media.ExifInterface;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
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
import com.cmue.model.User;
import com.cmue.util.AsyncTaskContent;
import com.cmue.util.Multimedia;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.nightonke.boommenu.BoomButtons.ButtonPlaceEnum;
import com.nightonke.boommenu.BoomButtons.HamButton;
import com.nightonke.boommenu.BoomButtons.OnBMClickListener;
import com.nightonke.boommenu.BoomMenuButton;
import com.nightonke.boommenu.ButtonEnum;
import com.nightonke.boommenu.Piece.PiecePlaceEnum;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import pub.devrel.easypermissions.EasyPermissions;

public class SendContentActivity extends AppCompatActivity {

    //Declaration values of the different options multimedia
    int[] list_drawable_option = new int[]{
            R.drawable.icon_camera,
            R.drawable.icon_audio,
            R.drawable.icon_video
    };
    int[] list_values_option = new int[]{
            R.string.take_picture,
            R.string.record_audio,
            R.string.record_video
    };
    int[] list_color_option = new int[]{
            R.color.colorPurple,
            R.color.colorOrange,
            R.color.colorBlue
    };

    //Declaration principal widgets
    BoomMenuButton bmb;
    ImageView imagePreview;
    VideoView videoPreview;
    ImageView img_selected_content;
    TextView label_content_selected;
    AutoCompleteTextView txt_content_community;
    TextView btn_enter;
    TextView btn_cancel;
    EditText txt_content_theme;
    EditText txt_content_description;

    //Values different options multimedia
    static final int REQUEST_TAKE_PHOTO = 1;
    static final int GALLERY_REQUEST_CODE = 2;
    static final int REQUEST_VIDEO_CAPTURE = 3;
    static final int REQUEST_AUDIO_CAPTURE = 4;
    static final int PHOTO = 1;
    static final int VIDEO = 2;
    static final int AUDIO = 3;
    static final int ERROR = 4;
    int targetW = 0;
    int targetH = 0;

    //Principal values
    String currentPhotoPath = "";
    String jsonUser;
    User user;
    Multimedia multimedia = new Multimedia();
    Community selected_community;
    Community[] list_communities;
    Map<String, Community> map_communities;
    Gson gson = new GsonBuilder().disableHtmlEscaping().create();

    /*
     * Principal thread, initialize and call functionalities
     * */
    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_send_content);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);

        try {
            Intent intent = getIntent();
            jsonUser = intent.getExtras().getString(getString(R.string.intent_user_information));
            user = gson.fromJson(jsonUser, User.class);
            if (!validateCommunities()) {
                throw new Exception();
            }
        } catch (Exception e) {
            //If user or communities info are wrong, return to main activity
            list_communities = new Community[]{};
            Toast.makeText(getApplicationContext(), R.string.error_unexpected, Toast.LENGTH_LONG).show();
            /*Intent return_emailactivity = new Intent(getApplicationContext(), EmailActivity.class);
            startActivity(return_emailactivity);
            finish();*/
        }

        //Initialize the principal widgets to control view
        img_selected_content = findViewById(R.id.img_selected_content);
        label_content_selected = findViewById(R.id.label_content_selected);
        imagePreview = findViewById(R.id.imagePreview);
        videoPreview = findViewById(R.id.videoPreview);
        txt_content_community = findViewById(R.id.txt_content_community);
        btn_enter = findViewById(R.id.btn_enter);
        btn_cancel = findViewById(R.id.btn_cancel);
        txt_content_theme = findViewById(R.id.txt_content_theme);
        txt_content_description = findViewById(R.id.txt_content_description);


        //Initialize Boom Menu with the options
        setBoomButton();

        //Initialize AutoCompleteText of community
        setAutoCompleteTextView();

        //Initialize Button Enter to send content
        setSendButton();

        //Initialize Button Cancel to reload the view
        setCancelButton();

    }

    /*
     * Control of media intent result
     * */
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == REQUEST_TAKE_PHOTO && resultCode == RESULT_OK) {
            try {
                if (setResultImageInPreview()) {
                    loadParamsMultimedia(PHOTO);
                } else {
                    //loadParamsMultimedia(ERROR);
                    Toast.makeText(getApplicationContext(),
                            R.string.file_size_violation,
                            Toast.LENGTH_LONG).show();
                }
            } catch (Exception e) {
                //loadParamsMultimedia(ERROR);
                Toast.makeText(getApplicationContext(),
                        R.string.file_image_error,
                        Toast.LENGTH_LONG).show();
            }
        }

        if (requestCode == GALLERY_REQUEST_CODE && resultCode == RESULT_OK) {
            try {
                Uri selectedImage = data.getData();
                String[] filePathColumn = {MediaStore.Images.Media.DATA};
                Cursor cursor = getContentResolver().query(selectedImage,
                        filePathColumn, null, null, null);
                cursor.moveToFirst();
                int columnIndex = cursor.getColumnIndex(filePathColumn[0]);
                currentPhotoPath = cursor.getString(columnIndex);
                cursor.close();
                if (setResultImageInPreview()) {
                    loadParamsMultimedia(PHOTO);
                } else {
                    //loadParamsMultimedia(ERROR);
                    Toast.makeText(getApplicationContext(),
                            R.string.file_size_violation,
                            Toast.LENGTH_LONG).show();
                }
            } catch (Exception e) {
                //loadParamsMultimedia(ERROR);
                Toast.makeText(getApplicationContext(),
                        R.string.file_image_error,
                        Toast.LENGTH_LONG).show();
            }
        }

        if (requestCode == REQUEST_VIDEO_CAPTURE && resultCode == RESULT_OK) {
            try {
                if (setResultVideoInPreview()) {
                    loadParamsMultimedia(VIDEO);
                } else {
                    //loadParamsMultimedia(ERROR);
                    Toast.makeText(getApplicationContext(),
                            R.string.file_size_violation,
                            Toast.LENGTH_LONG).show();
                }
            } catch (Exception e) {
                loadParamsMultimedia(ERROR);
                Toast.makeText(getApplicationContext(),
                        R.string.file_video_error,
                        Toast.LENGTH_LONG).show();
            }
        }


        if (requestCode == REQUEST_AUDIO_CAPTURE && resultCode == RESULT_OK) {
            try {
                currentPhotoPath = data.getExtras().getString("path");
                if (setResultAudioInPreview()) {
                    loadParamsMultimedia(AUDIO);
                } else {
                    //loadParamsMultimedia(ERROR);
                    Toast.makeText(getApplicationContext(),
                            R.string.file_size_violation,
                            Toast.LENGTH_LONG).show();
                }

            } catch (Exception e) {
                //loadParamsMultimedia(ERROR);
                Toast.makeText(getApplicationContext(),
                        R.string.file_audio_error,
                        Toast.LENGTH_LONG).show();
            }
        }

    }

    /*
     * Boom Menu: options menu load multimedia
     * - Declaration widget, options
     * - Set functionality when a option is selected
     * */
    public void setBoomButton() {
        bmb = (BoomMenuButton) findViewById(R.id.bmb);
        bmb.setShowDelay(100);
        bmb.setDimColor(getResources().getColor(R.color.colorTransparent));
        bmb.setDotRadius(0);
        bmb.setNormalColor(getResources().getColor(R.color.colorTransparent));
        bmb.setShowDuration(200);
        bmb.setHideDelay(100);
        bmb.setHideDuration(200);
        bmb.setButtonEnum(ButtonEnum.Ham);
        bmb.setPiecePlaceEnum(PiecePlaceEnum.HAM_3);
        bmb.setButtonPlaceEnum(ButtonPlaceEnum.HAM_3);
        for (int i = 0; i < bmb.getPiecePlaceEnum().pieceNumber(); i++) {
            final int position = i;
            HamButton.Builder builder = new HamButton.Builder()
                    .normalImageRes(list_drawable_option[i])
                    .normalText(getString(R.string.label_take) + " " + getString(list_values_option[i]))
                    .imagePadding(new Rect(20, 20, 20, 20))
                    .normalColorRes(list_color_option[i])
                    .textSize(20)
                    .normalTextColor(Color.WHITE)
                    .listener(new OnBMClickListener() {
                        @Override
                        public void onBoomButtonClick(int index) {
                            switch (list_values_option[position]) {
                                case R.string.take_picture:
                                    //If the option camera is selected in boomMenu, throw
                                    //functionality capture photo
                                    showPictureDialog();
                                    break;
                                case R.string.record_video:
                                    showVideoDialog();
                                    break;
                                case R.string.record_audio:
                                    Intent intent = new Intent(getApplicationContext(), RecordAudioActivity.class);
                                    startActivityForResult(intent, REQUEST_AUDIO_CAPTURE);
                                    break;
                            }

                        }
                    });
            bmb.addBuilder(builder);
        }
    }

    /*
     * Auto Complete TextView: communities options
     * - Declaration widget
     * - Set functionality when the focus change to validate a correct community
     * */
    private void setAutoCompleteTextView() {
        //Set the  list of names' communities
        txt_content_community.setText(user.getCommunity());
        String[] community_items_autoCTV = fillCommunityItems();

        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this,
                R.layout.dropdown_item,
                R.id.text_view_list_item,
                community_items_autoCTV);
        txt_content_community.setAdapter(adapter);

        //Listener when an item is selected
        txt_content_community.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                selectCommunity(txt_content_community.getText().toString());
            }
        });

        //Listener when the focus is on the autoComplete
        txt_content_community.setOnFocusChangeListener(new View.OnFocusChangeListener() {
            @Override
            public void onFocusChange(View view, boolean b) {
                if (b) {
                    //txt_content_community.showDropDown();
                } else {
                    //If the community selected does not exist, widget is cleaned
                    if (!map_communities.containsKey(txt_content_community.getText().toString().trim().toUpperCase())) {
                        txt_content_community.setText("");
                        selected_community = null;
                        Toast.makeText(getApplicationContext(),
                                getText(R.string.message_error_community),
                                Toast.LENGTH_LONG).show();
                    } else {
                        selectCommunity(txt_content_community.getText().toString());
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
        btn_cancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                AlertDialog.Builder cancelDialog = new AlertDialog.Builder(SendContentActivity.this);
                cancelDialog.setTitle(getString(R.string.confirm_cancellation));
                String[] cancelDialogItems = {
                        getString(R.string.accept_confirmation),
                        getString(R.string.cancel_confirmation)};
                cancelDialog.setItems(cancelDialogItems,
                        new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                switch (which) {
                                    case 0:
                                        //Reload the activity
                                        Intent go_sendContentActivity = new Intent(getApplicationContext(),
                                                SendContentActivity.class);
                                        go_sendContentActivity.putExtra(getString(R.string.intent_user_information),
                                                jsonUser);
                                        startActivity(go_sendContentActivity);
                                        finish();
                                        break;
                                    case 1:
                                        break;
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
        btn_enter.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                txt_content_community.setFocusable(true);
                txt_content_community.clearFocus();
                if (!map_communities.containsKey(txt_content_community.getText().toString().trim().toUpperCase())) {
                    txt_content_community.setText("");
                    selected_community = null;
                    Toast.makeText(getApplicationContext(),
                            getText(R.string.message_error_community),
                            Toast.LENGTH_LONG).show();
                    return;
                } else {
                    selectCommunity(txt_content_community.getText().toString());
                }
                String theme = txt_content_theme.getText().toString().trim();
                String description = txt_content_description.getText().toString().trim();
                String community = txt_content_community.getText().toString().trim();
                String type_content = multimedia.getType();
                String file_content = multimedia.getPath();

                if (!theme.equals("") && !community.equals("") && !type_content.equals("") && !file_content.equals("")) {
                    Date date = new Date();
                    /*try{
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
                         date = dateFormat.parse("2019-09-30");
                    } catch (Exception e){

                    }*/


                    final Content content = new Content();
                    content.setFile(file_content);
                    content.setCommunityObject(selected_community);
                    content.setUser_id(user.get_id());
                    content.setPostType(type_content);
                    content.setTopic(theme);
                    content.setDescription(!description.equals("") ? description : "-");
                    content.setDate(date);

                    android.app.AlertDialog.Builder alertDialog;
                    alertDialog = new android.app.AlertDialog.Builder(SendContentActivity.this);
                    alertDialog.setTitle(getString(R.string.title_send_content));
                    alertDialog.setMessage(getString(R.string.confirm_send_content));
                    alertDialog.setNeutralButton(getString(R.string.accept_confirmation),
                            new DialogInterface.OnClickListener() {
                                public void onClick(DialogInterface dialog, int which) {
                                    new AsyncTaskContent(SendContentActivity.this).execute(content);
                                    //Toast.makeText(getApplicationContext(), gson.toJson(content), Toast.LENGTH_LONG).show();
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


    private void showPictureDialog() {
        AlertDialog.Builder pictureDialog = new AlertDialog.Builder(this);
        pictureDialog.setTitle(getString(R.string.select_action));
        String[] pictureDialogItems = {
                getString(R.string.option_gallery),
                getString(R.string.option_camera)};
        pictureDialog.setItems(pictureDialogItems,
                new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        switch (which) {
                            case 0:
                                //Set permission to read phone information,
                                //access to the gallery
                                String[] galleryPermissions = {Manifest.permission.READ_EXTERNAL_STORAGE,
                                        Manifest.permission.WRITE_EXTERNAL_STORAGE};
                                if (EasyPermissions.hasPermissions(SendContentActivity.this,
                                        galleryPermissions)) {
                                    //If permission is conceded, go to gallery
                                    pickFromGallery();
                                } else {
                                    EasyPermissions.requestPermissions(SendContentActivity.this,
                                            "Access for storage",
                                            101, galleryPermissions);
                                }
                                break;
                            case 1:
                                //Go to take photos
                                takePictureIntent();
                                break;
                        }
                    }
                });
        pictureDialog.show();
    }

    private void takePictureIntent() {
        Intent takePictureIntent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        //Intent takePictureIntent = new Intent(Intent.ACTION_PICK);
        // Ensure that there's a camera activity to handle the intent
        if (takePictureIntent.resolveActivity(getPackageManager()) != null) {
            // Create the File where the photo should go
            File photoFile = null;
            try {
                photoFile = createImageFile();
            } catch (IOException ex) {
                // Error occurred while creating the File
                Toast.makeText(getApplicationContext(),
                        "Error creando archivo para imagen",
                        Toast.LENGTH_LONG).show();
            }
            // Continue only if the File was successfully created
            if (photoFile != null) {
                Uri photoURI = FileProvider.getUriForFile(this,
                        "com.cmue.umamakiapp.fileprovider",
                        photoFile);
                takePictureIntent.putExtra(MediaStore.EXTRA_OUTPUT, photoURI);
                startActivityForResult(takePictureIntent, REQUEST_TAKE_PHOTO);
            }
        }
    }

    private File createImageFile() throws IOException {
        // Create an image file name
        String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
        String imageFileName = "JPEG_" + timeStamp + "_";
        File storageDir = getExternalFilesDir(Environment.DIRECTORY_PICTURES);
        File image = File.createTempFile(
                imageFileName,  /* prefix */
                ".jpg",         /* suffix */
                storageDir      /* directory */
        );

        // Save a file: path for use with ACTION_VIEW intents
        currentPhotoPath = image.getAbsolutePath();

        return image;
    }

    private static float convertDpToPixel(float dp, Context context) {
        Resources resources = context.getResources();
        DisplayMetrics metrics = resources.getDisplayMetrics();
        float px = dp * ((float) metrics.densityDpi / DisplayMetrics.DENSITY_DEFAULT);
        return px;
    }

    private int getCameraPhotoOrientation(String imagePath) {
        int rotate = 0;
        try {
            File imageFile = new File(imagePath);

            ExifInterface exif = new ExifInterface(imageFile.getAbsolutePath());
            int orientation = exif.getAttributeInt(ExifInterface.TAG_ORIENTATION, ExifInterface.ORIENTATION_NORMAL);

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

    private void pickFromGallery() {
        //Create an Intent with action as ACTION_PICK
        Intent intent = new Intent(Intent.ACTION_PICK);
        // Sets the type as image/*. This ensures only components of type image are selected
        intent.setType("image/*");
        //We pass an extra array with the accepted mime types. This will ensure only components with these MIME types as targeted.
        String[] mimeTypes = {"image/jpg", "image/png"};
        intent.putExtra(Intent.EXTRA_MIME_TYPES, mimeTypes);
        // Launching the Intent
        startActivityForResult(intent, GALLERY_REQUEST_CODE);
    }

    private boolean setResultAudioInPreview() {

        File image = new File(currentPhotoPath);
        if (image.length() > (long) 25000000) return false;

        //float ancho = convertDpToPixel(300, SendContentActivity.this);
        float alto = convertDpToPixel(200, SendContentActivity.this);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, (int) alto);
        imagePreview.setLayoutParams(params);

        LinearLayout.LayoutParams paramsVideo = new LinearLayout.LayoutParams(0, 0);
        videoPreview.setLayoutParams(paramsVideo);


        imagePreview.setImageResource(R.drawable.icon_audio);

        return true;
    }

    private void loadParamsMultimedia(int option) {
        switch (option) {
            case PHOTO:
                img_selected_content.setImageResource(list_drawable_option[0]);
                label_content_selected.setText(getString(list_values_option[0]));
                multimedia = new Multimedia(currentPhotoPath, getString(R.string.take_picture));
                break;
            case ERROR:
                currentPhotoPath = "";
                img_selected_content.setImageResource(R.drawable.icon_content);
                imagePreview.setImageResource(R.drawable.icon_share_preview);
                label_content_selected.setText("");
                float alto = convertDpToPixel(200, SendContentActivity.this);
                LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, (int) alto);
                imagePreview.setLayoutParams(params);
                LinearLayout.LayoutParams paramsVideo = new LinearLayout.LayoutParams(0, 0);
                videoPreview.setLayoutParams(paramsVideo);
                multimedia = new Multimedia();
                break;
            case VIDEO:
                img_selected_content.setImageResource(list_drawable_option[2]);
                label_content_selected.setText(getString(list_values_option[2]));
                multimedia = new Multimedia(currentPhotoPath, getString(R.string.record_video));
                break;

            case AUDIO:
                img_selected_content.setImageResource(list_drawable_option[1]);
                label_content_selected.setText(getString(list_values_option[1]));
                multimedia = new Multimedia(currentPhotoPath, getString(R.string.record_audio));
                break;
        }
    }


    private boolean setResultImageInPreview() {

        File image = new File(currentPhotoPath);
        if (image.length() > (long) 25000000) return false;

        //float ancho = convertDpToPixel(300, SendContentActivity.this);
        float alto = convertDpToPixel(300, SendContentActivity.this);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, (int) alto);
        imagePreview.setLayoutParams(params);

        LinearLayout.LayoutParams paramsVideo = new LinearLayout.LayoutParams(0, 0);
        videoPreview.setLayoutParams(paramsVideo);

        // Get the dimensions of the bitmap

        if (imagePreview.getWidth() != 0 && imagePreview.getHeight() != 0) {
            targetW = imagePreview.getWidth();
            targetH = imagePreview.getHeight();
        }
        BitmapFactory.Options bmOptions = new BitmapFactory.Options();
        bmOptions.inJustDecodeBounds = true;

        int photoW = bmOptions.outWidth;
        int photoH = bmOptions.outHeight;

        // Determine how much to scale down the image
        int scaleFactor = Math.min(photoW / targetW, photoH / targetH);

        // Decode the image file into a Bitmap sized to fill the View
        bmOptions.inJustDecodeBounds = false;
        bmOptions.inSampleSize = scaleFactor;
        bmOptions.inPurgeable = true;

        Bitmap bitmap = BitmapFactory.decodeFile(currentPhotoPath, bmOptions);
        imagePreview.setImageBitmap(bitmap);

        int rotation = getCameraPhotoOrientation(currentPhotoPath);
        imagePreview.setRotation(rotation);
        return true;
    }


    /*----------------------------------------RECORD VIDEO----------------------------------------*/


    private void showVideoDialog() {

        takeVideoIntent();
    }

    private void takeVideoIntent() {
        Intent takePictureIntent = new Intent(MediaStore.ACTION_VIDEO_CAPTURE);
        //Intent takePictureIntent = new Intent(Intent.ACTION_PICK);
        // Ensure that there's a camera activity to handle the intent
        if (takePictureIntent.resolveActivity(getPackageManager()) != null) {
            // Create the File where the photo should go
            File videoFile = null;
            try {
                videoFile = createVideoFile();
            } catch (IOException ex) {
                // Error occurred while creating the File
                Toast.makeText(getApplicationContext(),
                        "Error creando archivo para video",
                        Toast.LENGTH_LONG).show();
            }
            // Continue only if the File was successfully created
            if (videoFile != null) {
                Uri videoURI = FileProvider.getUriForFile(this,
                        "com.cmue.umamakiapp.fileprovider",
                        videoFile);
                takePictureIntent.putExtra(MediaStore.EXTRA_OUTPUT, videoURI);
                //takePictureIntent.putExtra(MediaStore.EXTRA_VIDEO_QUALITY,0);
                takePictureIntent.putExtra(MediaStore.EXTRA_SIZE_LIMIT, 26214400L);
                startActivityForResult(takePictureIntent, REQUEST_VIDEO_CAPTURE);
            }
        }
    }

    private File createVideoFile() throws IOException {
        // Create an image file name
        String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
        String imageFileName = "MP4_" + timeStamp + "_";
        File storageDir = getExternalFilesDir(Environment.DIRECTORY_MOVIES);
        File image = File.createTempFile(
                imageFileName,  /* prefix */
                ".mp4",         /* suffix */
                storageDir      /* directory */
        );

        // Save a file: path for use with ACTION_VIEW intents
        currentPhotoPath = image.getAbsolutePath();

        return image;
    }

    private boolean setResultVideoInPreview() {

        File image = new File(currentPhotoPath);
        if (image.length() > (long) 27262976L) return false;

        //String filePath = SiliCompressor.with(getApplicationContext()).compresVi;
        float alto = convertDpToPixel(300, SendContentActivity.this);
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

        return true;
    }



    /*------------------------------------LOAD COMMUNITIES----------------------------------------*/

    /*
     * Read the information of communities from internal memory
     * */
    private boolean validateCommunities() {
        boolean flag;
        try {
            BufferedReader readToken = new BufferedReader(
                    new InputStreamReader(openFileInput("jsonCommunities.txt")));
            String jCommunities = readToken.readLine();
            //Toast.makeText(getApplicationContext(), jCommunities, Toast.LENGTH_LONG).show();
            readToken.close();
            list_communities = gson.fromJson(jCommunities, Community[].class);
            flag = true;
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    /*
     * Fill dictionary and items with community information
     * */
    public String[] fillCommunityItems() {
        List<String> list = new ArrayList<>();
        map_communities = new HashMap<String, Community>();
        for (Community aux : list_communities) {
            String key = aux.getName().toUpperCase();
            if (!map_communities.containsKey(key)) {
                map_communities.put(key, aux);
                list.add(aux.getName());
            }
        }
        String[] response = new String[list.size()];
        for (int i = 0; i < response.length; i++) {
            response[i] = list.get(i).toString();
        }
        return response;
    }

    /*
     * Set the information of nationality and community selected
     * */
    public void selectCommunity(String textSelected) {
        Community community = map_communities.get(textSelected.trim().toUpperCase());
        if (community != null) {
            selected_community = community;
        } else {
            selected_community = null;
        }
    }


}
