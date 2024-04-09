def buildApp() {
    echo 'building the application...'
}

def testApp() {
    echo 'building the application...'
}

def deployApp() {
    echo 'building the application...'
    echo 'deploying the application...'
    echo "deploying version ${params.VERSION}"
}

return this