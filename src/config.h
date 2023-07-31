static int topbar = 1;
static int fuzzy  = 1;

static unsigned int lines      = 0;
static unsigned int lineheight = 0;

static const char *prompt = "\uF002 ";

static const char *fonts[] = { "DroidSansM Nerd Font:size=11:antialias=true:autohint=true" };

static const char *colors[SchemeLast][2] = {
    /*                        fg         bg        */
    [SchemeNorm]          = { "#c5c8c6", "#1d1f21" },
    [SchemeSel]           = { "#1d1f21", "#f0c674" },
    [SchemeSelHighlight]  = { "#1d1f21", "#f0c674" },
    [SchemeNormHighlight] = { "#f0c674", "#1d1f21" },
    [SchemeOut]           = { "#000000", "#00ffff" },
};


/* Characters not considered part of a word while deleting words, for example: " /?\"&[]" */
static const char worddelimiters[] = " ";
