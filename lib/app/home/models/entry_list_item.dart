/*import 'package:time_tracker/app/home/job_entries/format.dart';
import 'package:time_tracker/app/home/models/entry.dart';
import 'package:time_tracker/app/home/models/job.dart';

/class EntryListItemModel {
  EntryListItemModel({ this.entry,  this.job});

    Entry? entry;
    Job? job;


    

  final dayOfWeek = Format.dayOfWeek(entry.start);
  final startDate = Format.date(entry.start);
  final startTime = TimeOfDay.fromDateTime(entry.start).format(context);
  final endTime = TimeOfDay.fromDateTime(entry.end).format(context);
  final durationFormatted = Format.hours(entry.durationInHours);

  final pay = job.ratePerHour! * entry.durationInHours;
  final payFormatted = Format.currency(pay);
}
*/
