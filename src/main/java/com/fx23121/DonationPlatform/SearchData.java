package com.fx23121.DonationPlatform;

import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class SearchData<T> {
    private int maxResultCount;
    private List<T> resultList;

    //constructor
    public SearchData() {
    }

    public SearchData(int maxResultCount, List<T> resultList) {
        this.maxResultCount = maxResultCount;
        this.resultList = resultList;
    }

    public int getMaxResultCount() {
        return maxResultCount;
    }

    public void setMaxResultCount(int maxResultCount) {
        this.maxResultCount = maxResultCount;
    }

    public List<T> getResultList() {
        return resultList;
    }

    public void setResultList(List<T> resultList) {
        this.resultList = resultList;
    }
}
