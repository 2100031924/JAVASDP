package com.example.SMS;
public class ChartData {
    private String label;
    private int value;

    public ChartData(String label, int value) {
        this.label = label;
        this.value = value;
    }

    // Getters and setters
    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }
}

