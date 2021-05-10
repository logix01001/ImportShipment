<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="{{ asset(mix('css/app.css')) }}">
    <script>
         var Laravel = {
            'csrfToken' : '{{csrf_token()}}'
        };
    </script>
</head>
<body>


        @inertia

    <script src="{{ asset(mix('js/app.js')) }}"></script>
</body>
</html>
