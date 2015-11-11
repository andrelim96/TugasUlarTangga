class Tile{
		private int x;
    private int y;
    private boolean isComet;
    private boolean isWormhole;

    public Tile(int x, int y) {
        this.x = x;
        this.y = y;
        this.isComet = false;
        this.isWormhole = false;
    }

    public int getX() {
        return this.x;
    }


    public int getY() {
        return this.y;
    }

    public void setX(int x) {
        this.x = x;
    }

    public void setY(int y) {
        this.y = y;
    }

    public boolean isComet() {
        return this.isComet;
    }

    public boolean isWormhole() {
        return this.isWormhole;
    }

    public void setAsWormhole() {
        this.isWormhole = true;
    }

    public void setAsComet() {
        this.isComet = true;
    }

    public String toString()
    {
        if(isComet) return " * ";
        else if(isWormhole) return " O ";
        else return " . ";
    }

}
