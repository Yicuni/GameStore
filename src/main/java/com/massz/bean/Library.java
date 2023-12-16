package com.massz.bean;

import java.util.Date;

public class Library {
    private int libraryId;

    private int playerID;

    private int gameId;

    private Date purchaseDate;

    public Library() {
    }

    public int getLibraryId() {
        return libraryId;
    }

    public void setLibraryId(int libraryId) {
        this.libraryId = libraryId;
    }

    public int getPlayerID() {
        return playerID;
    }

    public void setPlayerID(int playerID) {
        this.playerID = playerID;
    }

    public int getGameId() {
        return gameId;
    }

    public void setGameId(int gameId) {
        this.gameId = gameId;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    @Override
    public String toString() {
        return "Library{" +
                "libraryId=" + libraryId +
                ", playerID=" + playerID +
                ", gameId=" + gameId +
                ", purchaseDate=" + purchaseDate +
                '}';
    }
}
