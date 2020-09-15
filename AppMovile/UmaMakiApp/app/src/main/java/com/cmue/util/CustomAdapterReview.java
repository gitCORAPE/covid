package com.cmue.util;

import android.app.Activity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.cmue.model.Review;
import com.cmue.umamakiapp.R;

public class CustomAdapterReview extends BaseAdapter {

    private Review[] reviews;
    private LayoutInflater inflater;

    public CustomAdapterReview(Activity applicationContext, Review[] reviews) {

        this.reviews = reviews;
        this.inflater = (LayoutInflater.from(applicationContext));

    }

    @Override
    public int getCount() {
        return reviews.length;
    }

    @Override
    public Object getItem(int position) {
        return reviews[position];
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(final int position, View convertView, ViewGroup parent) {

        convertView = inflater.inflate(R.layout.item_list_all_review, null);

        TextView txt_review = convertView.findViewById(R.id.txt_review);
        TextView txt_user_name = convertView.findViewById(R.id.txt_user_name);
        ImageView img_accepted_rejected = convertView.findViewById(R.id.img_accepted_rejected);

        String review = reviews[position].getReviewText() != null
                ? reviews[position].getReviewText() : "";
        String userName = reviews[position].getReviewer() != null
                ? reviews[position].getReviewer().getName() : "";
        String type = reviews[position].getStatusReviews() != null
                ? reviews[position].getStatusReviews() : "Approved";

        txt_review.setText(review);
        txt_user_name.setText(userName);

        if (!type.equals("Approved")) {
            img_accepted_rejected.setImageResource(R.drawable.icon_rejected);
        }

        return convertView;

    }

}
