function fn() {
    var config = {
        AmadeusApiUrl: 'https://flights-api.buraky.workers.dev/'
    };
    karate.configure('ssl', true);
    return config;
}