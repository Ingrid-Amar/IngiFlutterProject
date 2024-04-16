import "package:googleapis_auth/auth_io.dart";
import 'package:googleapis/calendar/v3.dart';

static const _scopes = const [CalendarApi.CalendarScope];

var _credentials;
if (Platform.isAndroid) {
      _credentials = new ClientId(
          "264597562118-d419ef8ce9g2sssokldj3qs1th0ejbv2.apps.googleusercontent.com",
          "");
    } else if (Platform.isIOS) {
      _credentials = new ClientId(
          "264597562118-d419ef8ce9g2sssokldj3qs1th0ejbv2.apps.googleusercontent.com",
          "");
    }

Event event = Event(); // Create object of event
event.summary = summaryText; //Setting summary of object

EventDateTime start = new EventDateTime(); //Setting start time
      start.dateTime = startTime;
      start.timeZone = "GMT+05:00";
      event.start = start;

      
      EventDateTime end = new EventDateTime(); //setting end time
      end.timeZone = "GMT+05:00";
      end.dateTime = endTime;
      event.end = end;


insertEvent(event){
try {
        clientViaUserConsent(_clientID, _scopes, prompt).then((AuthClient client){
        var calendar = CalendarApi(client);
        String calendarId = "primary";
        calendar.events.insert(event,calendarId).then((value) {
          print("ADDEDDD_________________${value.status}");
          if (value.status == "confirmed") {
            log('Event added in google calendar');
          } else {
            log("Unable to add event in google calendar");
          }
        });
        });
      } catch (e) {
        log('Error creating event $e');
      }
}

  void prompt(String url) async {

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }