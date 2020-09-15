package com.cmue.syncapp.application;

import android.app.Application;
import android.content.ContentResolver;

public class AppController extends Application {

    public static final String TAG = AppController.class.getSimpleName();

    private RequestQueue mRequestQueue;
    private ImageLoader mImageLoader;

    private static AppController mInstance;
    private static ContentResolver resolver;

    public static final String AUTHORITY =
}
