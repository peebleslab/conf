
backend site {
    .host = "127.0.0.1";
    .port = "8080";
}

backend store {
    .host = "127.0.0.1";
    .port = "8081";
}

backend admin {
    .host = "127.0.0.1";
    .port = "8082";
}

backend vault {
    .host = "127.0.0.1";
    .port = "8083";
}

backend sitedev {
    .host = "127.0.0.1";
    .port = "8084";
}

backend storedev {
    .host = "127.0.0.1";
    .port = "8085";
}

backend admindev {
    .host = "127.0.0.1";
    .port = "8086";
}

backend vaultdev {
    .host = "127.0.0.1";
    .port = "8087";
}

sub vcl_recv {

    if (req.http.host ~ "dev\.store\..*") {
        set req.backend = storedev;
    }
    else if (req.http.host ~ "dev\.admin\..*") {
        set req.backend = admindev;
    }
    else if (req.http.host ~ "dev\.vault\..*") {
        set req.backend = vaultdev;
    }
    else if (req.http.host ~ "dev\.www\.*") {
        set req.backend = sitedev;
    }
    else if (req.http.host ~ "store\..*") {
        set req.backend = store;
    }
    else if (req.http.host ~ "admin\..*") {
        set req.backend = admin;
    }
    else if (req.http.host ~ "vault\..*") {
        set req.backend = vault;
    }
    else {
        set req.backend = site;
    }

    return (lookup);
}

