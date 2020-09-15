package com.cmue.util;

import android.util.Log;

import com.cmue.model.Content;

import java.io.File;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

import okhttp3.MediaType;
import okhttp3.MultipartBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class RestClient {

    private static String URI = "http://ec2-18-224-25-133.us-east-2.compute.amazonaws.com:3000/";


    private static final MediaType JSON = MediaType.parse("application/json; charset=utf-8");
    private OkHttpClient client = new OkHttpClient();

    public String eventGet(String URIComplement) throws IOException {

        Request request = new Request.Builder()
                .url(URI + URIComplement)
                .build();
        Response response = client.newCall(request).execute();

        if (response.code() == 500) {
            return null;
        }

        return response.body().string();

    }

    public boolean isOnlineServices() throws IOException {

        OkHttpClient client = new OkHttpClient.Builder()
                .connectTimeout(3, TimeUnit.SECONDS)
                .writeTimeout(3, TimeUnit.SECONDS)
                .readTimeout(3, TimeUnit.SECONDS)
                .build();

        Request request = new Request.Builder()
                .url(URI)
                .build();
        Response response = client.newCall(request).execute();

        return response.code() == 404;

    }

    public boolean isOnlineNet() {

        try {
            OkHttpClient client = new OkHttpClient.Builder()
                    .connectTimeout(2, TimeUnit.SECONDS)
                    .writeTimeout(2, TimeUnit.SECONDS)
                    .readTimeout(2, TimeUnit.SECONDS)
                    .build();

            Request request = new Request.Builder()
                    .url("http://www.google.es")
                    .build();
            Response response = client.newCall(request).execute();

            return response.code() == 200;
        } catch (Exception e) {
            Log.e("Error OnlineNet", e.toString());
            return false;
        }

    }

    public String eventPost(String URIComplement, String POSTText) throws IOException {

        RequestBody body = RequestBody.create(JSON, POSTText);
        Request request = new Request.Builder()
                .header("CONTENT_TYPE", "application/json")
                .url(URI + URIComplement)
                .post(body)
                .build();
        Response response = client.newCall(request).execute();

        if (response.code() == 500) {
            return null;
        }

        return response.body().string();

    }

    public String eventPut(String URIComplement, String PUTText) throws IOException {

        RequestBody body = RequestBody.create(JSON, PUTText);
        Request request = new Request.Builder()
                .header("CONTENT_TYPE", "application/json")
                .url(URI + URIComplement)
                .put(body)
                .build();
        Response response = client.newCall(request).execute();

        if (response.code() == 200 || response.code() == 201) {

            return response.body().string();
        }

        return null;

    }


    public String eventPostContentImage(Content postContent) throws IOException {

        File file = new File(postContent.getFile());
        String fileName = file.getName().replace('.', '-') + ".jpg";
        RequestBody requestBody = new MultipartBody.Builder()
                .setType(MultipartBody.FORM)
                .addFormDataPart("file", fileName, RequestBody.create(MediaType.parse("image/jpg"), file))
                .addFormDataPart("filePath", fileName)
                .addFormDataPart("community", (postContent.getCommunityObject().get_id()))
                .addFormDataPart("user", postContent.getUser_id())
                .addFormDataPart("postType", "Image")
                .addFormDataPart("location", "{" +
                        " \"type\": \"Point\"," +
                        "        \"coordinates\": [" +
                        "          -78.519287109375," +
                        "          -0.208739772610497" +
                        "        ]" +
                        "      }")
                .addFormDataPart("topic", postContent.getTopic())
                .addFormDataPart("description", postContent.getDescription())
                .build();

        Request request = new Request.Builder().url(URI + "contentPosts").post(requestBody).build();
        Response response = this.client.newCall(request).execute();

        if (response.code() != 201) {
            return "@#$@%" + response.body().string();
        }

        return response.body().string();

    }

    public String eventPostContentVideo(Content postContent) throws IOException {

        File file = new File(postContent.getFile());
        String fileName = file.getName().replace('.', '-') + ".mp4";
        RequestBody requestBody = new MultipartBody.Builder()
                .setType(MultipartBody.FORM)
                .addFormDataPart("file", fileName, RequestBody.create(MediaType.parse("video/mp4"), file))
                .addFormDataPart("filePath", fileName)
                .addFormDataPart("community", (postContent.getCommunityObject().get_id()))
                .addFormDataPart("user", postContent.getUser_id())
                .addFormDataPart("postType", "Video")
                .addFormDataPart("location", "{" +
                        " \"type\": \"Point\"," +
                        "        \"coordinates\": [" +
                        "          -78.519287109375," +
                        "          -0.208739772610497" +
                        "        ]" +
                        "      }")
                .addFormDataPart("topic", postContent.getTopic())
                .addFormDataPart("description", postContent.getDescription())
                .build();

        Request request = new Request.Builder().url(URI + "contentPosts").post(requestBody).build();
        Response response = this.client.newCall(request).execute();

        if (response.code() != 201) {
            return "@#$@%" + response.body().string();
        }

        return response.body().string();

    }

    public String eventPostContentAudio(Content postContent) throws IOException {

        File file = new File(postContent.getFile());
        String fileName = file.getName().replace('.', '-') + ".mp3";

        RequestBody requestBody = new MultipartBody.Builder()
                .setType(MultipartBody.FORM)
                .addFormDataPart("file", fileName,
                        RequestBody.create(MediaType.parse("audio/mp3"), file))
                .addFormDataPart("filePath", fileName)
                .addFormDataPart("community", (postContent.getCommunityObject().get_id()))
                .addFormDataPart("user", postContent.getUser_id())
                .addFormDataPart("postType", "Audio")
                .addFormDataPart("location", "{" +
                        " \"type\": \"Point\"," +
                        "        \"coordinates\": [" +
                        "          -78.519287109375," +
                        "          -0.208739772610497" +
                        "        ]" +
                        "      }")
                .addFormDataPart("topic", postContent.getTopic())
                .addFormDataPart("description", postContent.getDescription())
                .build();

        Request request = new Request.Builder().url(URI + "contentPosts").post(requestBody).build();
        Response response = this.client.newCall(request).execute();

        if (response.code() != 201) {
            return "@#$@%" + response.body().string();
        }

        return response.body().string();

    }

}
