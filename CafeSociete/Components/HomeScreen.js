import React from 'react';
import { StyleSheet, View, Image, ActivityIndicator, TouchableOpacity, Text, ScrollView } from 'react-native';
import Auth from './Auth';

export class HomeScreen extends React.Component {
    static navigationOptions = {
        title: 'Welcome',
        headerStyle: {
            marginTop: Expo.Constants.statusBarHeight,
        },
    };

    constructor (props)
    {
        super(props);
        this.state = {
            isLoading: true
        };
        if (Auth.token == null)
            Auth.token = this.getToken();
    }

    async getToken()
    {
        return fetch(Auth.url + Auth.LOGIN_URL, {
            method: 'POST',
            headers: { 'Accept': 'application/json', 'Content-Type': 'application/json', },
            body: JSON.stringify({ email: 'toto@toto.fr', password: 'titi', }),
            mode: 'cors',
            cache: 'default'
        }).then((response) => response.json())
            .then((responseJson) => {
            this.setState ({
                isLoading: false,
            });
            Auth.token = responseJson.auth_token;
        }).catch((error) => {
            console.error("Test : " + error);
            this.setState ({
                isLoading: false,
            });
        });
    }

    render() {
        const { navigate } = this.props.navigation;

        if (this.state.isLoading) {
            return (
                <View style={{flex: 1, paddingTop: '5%', margin: 'auto'}}>
                    <ActivityIndicator />
                </View>
            );
        }

        return (
            <ScrollView contentContainerStyle={styles.container}>
                <Image
                    style={{width: 200, height: 200}}
                    source={{ uri: 'http://api.eliastre100.fr/toto.jpg'}}
                />
                <TouchableOpacity activeOpacity={0.8} style={styles.customTouch}>
                    <Text style={styles.customTouchText}>Découvrir</Text>
                </TouchableOpacity>
                <TouchableOpacity activeOpacity={0.8} style={styles.customTouch} onPress={() => navigate('Search')}>
                    <Text style={styles.customTouchText}>Recherche</Text>
                </TouchableOpacity>
                <TouchableOpacity activeOpacity={0.8} style={styles.customTouch} onPress={() => navigate('Quizz')}>
                    <Text style={styles.customTouchText}>Quizz</Text>
                </TouchableOpacity>
            </ScrollView>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#fff',
        alignItems: 'center',
        justifyContent: 'center'
    },
    customTouch: {
        backgroundColor: '#232e5d',
        width: '70%',
        marginTop: '10%',
        paddingTop: '5%',
        paddingBottom: '5%',
    },
    customTouchText: {
        textAlign: 'center',
        fontSize: 20,
        color: 'white',
    },
    customButton: {
        margin: 'auto'
    }
});