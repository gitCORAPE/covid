package com.cmue.umamakiapp;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;

import android.Manifest;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.text.InputType;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.cmue.model.Comment;
import com.cmue.model.Community;
import com.cmue.model.ContentPost;
import com.cmue.model.Like;
import com.cmue.model.Review;
import com.cmue.model.ReviewSend;
import com.cmue.model.User;
import com.cmue.util.RestClient;
import com.cmue.util.Singleton;
import com.cmue.util.UtilFunctions;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import pub.devrel.easypermissions.EasyPermissions;

public class SeeSpecificContentActivity extends AppCompatActivity implements EasyPermissions.PermissionCallbacks {

    private LinearLayout btnSeeMultimediaContent;
    private TextView txtNameAuthorContent;
    private TextView txtCommunityTypeContent;
    private TextView txtStateContent;
    private TextView txtDescriptionContent;
    private TextView txtNumberLikes;
    private ImageView btnLike;
    private TextView txtNumberDislikes;
    private ImageView btnDislike;
    private ImageView btnApproveContent;
    private TextView btnComments;
    private TextView btnReviews;
    private EditText txtComment;
    private TextView btnSendComment;

    private String url;
    private String likeStatus = "NONE";
    private String review="";
    private String statusReview="";
    private ContentPost contentPost;
    private User user;
    private User currentUser;
    private Community community;
    private String strComment;
    private Gson gson = new GsonBuilder().disableHtmlEscaping().create();
    private static final int WRITE_REQUEST_CODE = 300;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_see_specific_content);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);

        try {
            contentPost = Singleton.getInstance().getContentPost();
            currentUser = Singleton.getInstance().getCurrentUser();
            user = contentPost.getUser();
            community = contentPost.getCommunity();
            if (user == null || community == null) throw new Exception();
            buildWidgets();
            initWidgets();

        } catch (Exception e) {

            Toast.makeText(getApplicationContext(),
                    getString(R.string.error_unexpected),
                    Toast.LENGTH_LONG).show();
            finish();

        }

    }

    private void initWidgets() {

        txtNameAuthorContent.setText(user.getName());
        txtCommunityTypeContent.setText(community.getName() + " / " + contentPost.getPostType());
        txtStateContent.setText(contentPost.isInReview() ? R.string.no_approved : R.string.is_approved);
        txtDescriptionContent.setText(contentPost.getDescription());
        txtNumberLikes.setText(String.valueOf(contentPost.getLikes()));
        txtNumberDislikes.setText(String.valueOf(contentPost.getDislikes()));
        likeStatus = contentPost.getLikeStatus() != null ? contentPost.getLikeStatus() : "";

        switch (likeStatus) {
            case "LIKE":
                setLikeStatus(true);
                break;
            case "DISLIKE":
                setLikeStatus(false);
                break;
        }


        if(!contentPost.isInReview() || !("COMUNICADOR").equals(currentUser.getBadge()) || !contentPost.getCommunity().get_id().equals(currentUser.getCommunityId())){
            btnApproveContent.setVisibility(View.GONE);
        }

        btnSeeMultimediaContent.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                if (EasyPermissions.hasPermissions(SeeSpecificContentActivity.this, Manifest.permission.WRITE_EXTERNAL_STORAGE)) {
                    //Get the URL entered
                    url = contentPost.getFilePath();
                    new AsyncTaskDownloadFile().execute(url);

                } else {
                    //If permission is not present request for the same.
                    EasyPermissions.requestPermissions(SeeSpecificContentActivity.this, getString(R.string.write_file), WRITE_REQUEST_CODE, Manifest.permission.READ_EXTERNAL_STORAGE);
                }

            }
        });

        btnSendComment.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                strComment = txtComment.getText().toString();

                if (!strComment.equals("")) {
                    new AsyncTaskSendComment().execute();
                } else {
                    Toast.makeText(getApplicationContext(),
                            getString(R.string.error_no_comment),
                            Toast.LENGTH_LONG).show();
                }

            }
        });

        btnReviews.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                SeeReviewsContent();
            }
        });

        btnLike.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                new AsyncTaskLikeContent().execute(true);
            }
        });

        btnDislike.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                new AsyncTaskLikeContent().execute(false);
            }
        });

        btnApproveContent.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                final EditText input = new EditText(SeeSpecificContentActivity.this);
                input.setInputType(InputType.TYPE_CLASS_TEXT);
                android.app.AlertDialog.Builder alertDialog;
                alertDialog = new android.app.AlertDialog.Builder(SeeSpecificContentActivity.this);
                alertDialog.setTitle("Aprobar un Contendido");
                alertDialog.setView(input);
                alertDialog.setMessage("Deja una reseña acerca de este contenido");
                alertDialog.setPositiveButton("Aprobar",
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {
                                review = input.getText().toString();
                                statusReview = "Approved";
                                new AsyncSendReview().execute();
                            }
                        });
                alertDialog.setNegativeButton("Solicitar cambio",
                        new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialog, int which) {
                                review = input.getText().toString();
                                statusReview = "Declined";
                                new AsyncSendReview().execute();
                            }
                        });

                alertDialog.show();
            }
        });
    }

    private void setLikeStatus(boolean isLike) {

        btnLike.setColorFilter(ContextCompat.getColor(getApplicationContext(),
                R.color.colorHintEditText));
        btnDislike.setColorFilter(ContextCompat.getColor(getApplicationContext(),
                R.color.colorHintEditText));

        if (isLike) {
            btnLike.setColorFilter(ContextCompat.getColor(getApplicationContext(),
                    R.color.colorGreen));
        } else {
            btnDislike.setColorFilter(ContextCompat.getColor(getApplicationContext(),
                    R.color.colorRed));
        }

    }

    private void buildWidgets() {

        btnSeeMultimediaContent = findViewById(R.id.btnSeeMultimediaContent);
        txtNameAuthorContent = findViewById(R.id.txtNameAuthorContent);
        txtCommunityTypeContent = findViewById(R.id.txtCommunityTypeContent);
        txtStateContent = findViewById(R.id.txtStateContent);
        txtDescriptionContent = findViewById(R.id.txtDescriptionContent);
        txtNumberLikes = findViewById(R.id.txtNumberLikes);
        btnLike = findViewById(R.id.btnLike);
        txtNumberDislikes = findViewById(R.id.txtNumberDislikes);
        btnDislike = findViewById(R.id.btnDislike);
        btnApproveContent = findViewById(R.id.btnApproveContent);
        btnComments = findViewById(R.id.btnComments);
        btnReviews = findViewById(R.id.btnReviews);
        txtComment = findViewById(R.id.txtComment);
        btnSendComment = findViewById(R.id.btnSendComment);

    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        EasyPermissions.onRequestPermissionsResult(requestCode, permissions, grantResults, SeeSpecificContentActivity.this);
    }

    @Override
    public void onPermissionsGranted(int requestCode, List<String> perms) {
        url = contentPost.getFilePath();
        new AsyncTaskDownloadFile().execute(url);
    }

    @Override
    public void onPermissionsDenied(int requestCode, List<String> perms) {
        //Log.d(TAG, "Permission has been denied");
    }

    public void SeeReviewsContent() {

        Review[] reviews = contentPost.getReviews();

        if (reviews != null && reviews.length > 0) {
            Intent intentReviews = new Intent(getApplicationContext(), SeeReviewCommentActivity.class);
            intentReviews.putExtra("type", "review");
            startActivity(intentReviews);
        } else {
            Toast.makeText(getApplicationContext(),
                    getString(R.string.error_no_reviews),
                    Toast.LENGTH_LONG).show();
        }

    }


    private class AsyncTaskDownloadFile extends AsyncTask<String, String, String> {

        private ProgressDialog progressDialog;
        private String currentPhotoPath;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            this.progressDialog = new ProgressDialog(SeeSpecificContentActivity.this);
            this.progressDialog.setProgressStyle(ProgressDialog.STYLE_HORIZONTAL);
            this.progressDialog.setCancelable(false);
            this.progressDialog.show();
        }


        @Override
        protected String doInBackground(String... f_url) {

            int count;

            try {

                URL url = new URL(f_url[0]);
                URLConnection connection = url.openConnection();
                connection.connect();

                int lengthOfFile = connection.getContentLength();

                InputStream input = new BufferedInputStream(url.openStream(), 8192);

                File file = null;

                switch (contentPost.getPostType()) {
                    case "Image":
                        file = createImageFile();
                        break;
                    case "Video":
                        file = createVideoFile();
                        break;
                    case "Audio":
                        file = createAudioFile();
                        break;
                }

                OutputStream output = new FileOutputStream(file);

                byte data[] = new byte[1024];

                long total = 0;

                while ((count = input.read(data)) != -1) {
                    total += count;
                    publishProgress("" + (int) ((total * 100) / lengthOfFile));
                    output.write(data, 0, count);
                }

                output.flush();
                output.close();
                input.close();

                return currentPhotoPath;

            } catch (Exception e) {
                Log.e("Error: ", e.getMessage() != null ? e.getMessage() : "");
            }

            return "";
        }


        private File createImageFile() throws IOException {

            String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
            String imageFileName = "JPEG_" + timeStamp + "_";
            File storageDir = getExternalFilesDir(Environment.DIRECTORY_PICTURES);
            File image = File.createTempFile(
                    imageFileName,
                    ".jpg",
                    storageDir
            );

            currentPhotoPath = image.getAbsolutePath();
            return image;
        }


        private File createVideoFile() throws IOException {

            String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
            String imageFileName = "MP4_" + timeStamp + "_";
            File storageDir = getExternalFilesDir(Environment.DIRECTORY_MOVIES);
            File image = File.createTempFile(
                    imageFileName,
                    ".mp4",
                    storageDir
            );

            currentPhotoPath = image.getAbsolutePath();

            return image;
        }


        private File createAudioFile() throws IOException {

            String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
            String imageFileName = "MP3_" + timeStamp + "_";
            File storageDir = getExternalFilesDir(Environment.DIRECTORY_PODCASTS);
            File image = File.createTempFile(
                    imageFileName,
                    ".mp3",
                    storageDir
            );

            currentPhotoPath = image.getAbsolutePath();

            return image;
        }

        protected void onProgressUpdate(String... progress) {
            progressDialog.setProgress(Integer.parseInt(progress[0]));
        }


        @Override
        protected void onPostExecute(String message) {

            this.progressDialog.dismiss();

            Toast.makeText(getApplicationContext(),
                    message, Toast.LENGTH_LONG).show();

            if (!message.equals("")) {

                switch (contentPost.getPostType()) {
                    case "Video":
                        Intent intentVideo = new Intent(getApplicationContext(), SeeVideoContentActivity.class);
                        intentVideo.putExtra("path", message);
                        startActivity(intentVideo);
                        break;
                    case "Image":
                        Intent intentImage = new Intent(getApplicationContext(), SeeImageContentActivity.class);
                        intentImage.putExtra("path", message);
                        startActivity(intentImage);
                        break;
                    case "Audio":
                        Intent intentAudio = new Intent(getApplicationContext(), SeeAudioContentActivity.class);
                        intentAudio.putExtra("path", message);
                        startActivity(intentAudio);
                        break;
                }

            }

        }

    }

    private class AsyncTaskSendComment extends AsyncTask<Void, Integer, Void> {

        private ProgressDialog progressDialog;
        private String general_result;

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = ProgressDialog.show(
                    SeeSpecificContentActivity.this, "Por favor espere", "Procesando...");
        }

        @Override
        protected Void doInBackground(Void... voids) {

            Gson gson = new GsonBuilder().disableHtmlEscaping().create();
            RestClient restClient = new RestClient();

            general_result = UtilFunctions.validateOnlineNetServices();

            if (general_result == null) {

                try {

                    Comment commentJson = new Comment();
                    commentJson.setPost(contentPost.get_id());
                    commentJson.setUser(currentUser.get_id());
                    commentJson.setUserName(currentUser.getName());
                    commentJson.setContent(strComment);

                    String resultJson = restClient.eventPost("comments", gson.toJson(commentJson));
                    Comment resultComment = gson.fromJson(resultJson, Comment.class);

                    if (resultComment.get_id() == null || resultComment.get_id().equals("")) {
                        throw new Exception(getString(R.string.error_unexpected));
                    }

                } catch (Exception e) {

                    general_result = e.getMessage();

                }

            }
            return null;
        }

        @Override
        protected void onPostExecute(Void result) {

            progressDialog.dismiss();

            if (general_result == null) {

                general_result = getString(R.string.send_comment_successful);
                txtComment.setText("");

            }

            Toast.makeText(getApplicationContext(), general_result, Toast.LENGTH_LONG).show();

        }

    }

    private class AsyncTaskLikeContent extends AsyncTask<Object, Void, String> {

        private ProgressDialog progressDialog;
        private String general_result;

        @Override
        protected String doInBackground(Object... obj) {

            RestClient restClient = new RestClient();

            general_result = UtilFunctions.validateOnlineNetServices();

            String type = (boolean) obj[0] ? "LIKE" : "DISLIKE";

            if (type.equals(likeStatus)) {
                general_result = getString(R.string.just_liked_message) + (type.equals("LIKE")
                        ? getString(R.string.status_like)
                        : getString(R.string.status_dislike));
                return "";
            }

            if (general_result == null) {

                try {

                    Like likeJson = new Like();
                    likeJson.setContentPost(contentPost.get_id());
                    likeJson.setUser(currentUser.get_id());
                    likeJson.setType(type);

                    String resultJson = restClient.eventPut("contentPosts/like", gson.toJson(likeJson));
                    Like resultLike = gson.fromJson(resultJson, Like.class);

                    if (resultLike.getMessage() == null || resultLike.getMessage().equals("")) {
                        throw new Exception(getString(R.string.error_unexpected));
                    }

                } catch (Exception e) {

                    general_result = getString(R.string.error_unexpected);

                }

            }

            return type;
        }


        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = ProgressDialog.show(
                    SeeSpecificContentActivity.this, "Por favor espere", "Procesando...");
        }


        @Override
        protected void onPostExecute(String result) {

            progressDialog.dismiss();

            if (general_result == null) {

                general_result = getString(R.string.liked_message);
                general_result += result.equals("LIKE")
                        ? getString(R.string.status_like)
                        : getString(R.string.status_dislike);

                switch (likeStatus) {
                    case "LIKE":
                        int numberLikes = Integer.parseInt(txtNumberLikes.getText().toString().trim());
                        txtNumberLikes.setText(String.valueOf(numberLikes - 1));
                        break;
                    case "DISLIKE":
                        int numberDislikes = Integer.parseInt(txtNumberDislikes.getText().toString().trim());
                        txtNumberDislikes.setText(String.valueOf(numberDislikes - 1));
                        break;
                }

                likeStatus = result;

                if (likeStatus.equals("LIKE")) {
                    setLikeStatus(true);
                    int numberLikes = Integer.parseInt(txtNumberLikes.getText().toString().trim());
                    txtNumberLikes.setText(String.valueOf(numberLikes + 1));
                } else {
                    setLikeStatus(false);
                    int numberDislikes = Integer.parseInt(txtNumberDislikes.getText().toString().trim());
                    txtNumberDislikes.setText(String.valueOf(numberDislikes + 1));
                }
            }

            Toast.makeText(getApplicationContext(), general_result, Toast.LENGTH_LONG).show();

        }

    }

    private class AsyncSendReview extends AsyncTask<Object, Void, String> {

        private ProgressDialog progressDialog;
        private String general_result;


        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = ProgressDialog.show(
                    SeeSpecificContentActivity.this, "Por favor espere", "Procesando...");
        }

        @Override
        protected String doInBackground(Object... obj) {

            RestClient restClient = new RestClient();

            general_result = UtilFunctions.validateOnlineNetServices();


            if (general_result == null) {

                try {

                    ReviewSend reviewJson = new ReviewSend();
                    reviewJson.setReviewer(currentUser.get_id());
                    reviewJson.setStatusReviews(statusReview);
                    reviewJson.setReviewText(review);
                    String resultJson = restClient.eventPut("contentPosts/"+contentPost.get_id()+"/review", gson.toJson(reviewJson));
                    String result = gson.fromJson(resultJson, String.class);

                    if (!("ok").equals(result)) {
                        throw new Exception(getString(R.string.error_unexpected));
                    }

                } catch (Exception e) {
                    general_result = getString(R.string.error_unexpected);
                    return  null;
                }

            }

            general_result="Hemos registrado tu operación, gracias por contribuir";

            return "ok";
        }


        @Override
        protected void onPostExecute(String result) {

            progressDialog.dismiss();
            Toast.makeText(getApplicationContext(), general_result, Toast.LENGTH_LONG).show();
            Intent intent= new Intent (SeeSpecificContentActivity.this, MainActivity.class);
            startActivity(intent);
            finish();
        }

    }


}
