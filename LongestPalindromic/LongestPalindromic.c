char *save;
int sLen;


char* longestPalindrome(char* s) {
    sLen = 0;
    if(strlen(s) < 2) {
        return s;
    }
    for(int i = 0; i < strlen(s) - 1; i++) {
        extendStringTwoSides(s, i, i);
        extendStringTwoSides(s, i, i+1);
    }
    save[sLen] = 0;
    return save;
}


void extendStringTwoSides(char *s, int n1, int n2) {
    int len = strlen(s);
    int k = n1, j = n2;
    while (k >= 0 && j < len) {
        if(s[k] != s[j]) {
            break;
        }
        k--;
        j++;
    }
    if(j - k - 1 > sLen) {
        sLen = j-k-1;
        save = s + k + 1;
    }
}
