import { useState } from "react";
import "./styles.scss";

function Appointment() {
  const [nhsNumber, setNhsNumber] = useState("");
  const [date, setDate] = useState("");
  const [appointments, setAppointments] = useState([]);

  const handleSubmit = async (event) => {
    event.preventDefault();
    const response = await fetch(
      `/api/appointments?nhsNumber=${nhsNumber}&date=${date}`
    );
    const data = await response.json();
    setAppointments(data);
  };

  const handleDelete = async (appointmentNumber) => {
    await fetch(`/api/appointments/${appointmentNumber}`, { method: "DELETE" });
    setAppointments((currentAppointments) =>
      currentAppointments.filter(
        (appointment) => appointment.appointment_number !== appointmentNumber
      )
    );
  };

  return (
    <>
      <div className="govuk-width-container ">
        <h2 className="govuk-cookie-banner__heading govuk-heading-m">
          GP Appointments
        </h2>
        <form onSubmit={handleSubmit}>
          <label className="govuk-label govuk-label--3" htmlFor="nhsNumber">
            NHS Number:
          </label>
          <input
            className="govuk-label"
            for="width-8"
            type="text"
            id="nhsNumber"
            value={nhsNumber}
            onChange={(event) => setNhsNumber(event.target.value)}
          />
          <label className="govuk-label govuk-label--3" htmlFor="date">
            Date of Appointment:
          </label>
          <input
            className="govuk-label"
            for="width-5"
            type="date"
            id="date"
            value={date}
            onChange={(event) => setDate(event.target.value)}
          />
          <button
            className="govuk-button"
            data-module="govuk-button"
            type="submit"
          >
            Search
          </button>
        </form>
        <table className="govuk-table">
          <thead className="govuk-table__head">
            <tr className="govuk-table__row">
              <th scope="col" className="govuk-table__header">
                Appointment Number
              </th>
              <th scope="col" className="govuk-table__header">
                NHS Number
              </th>
              <th scope="col" className="govuk-table__header">
                Medical License
              </th>
              <th scope="col" className="govuk-table__header">
                Date of Appointment
              </th>
              <th scope="col" className="govuk-table__header">
                Time of Appointment
              </th>
              <th scope="col" className="govuk-table__header">
                Appointment Notes
              </th>
              <th scope="col" className="govuk-table__header">
                Actions
              </th>
            </tr>
          </thead>
          <tbody className="govuk-table__body">
            {appointments.map((appointment) => (
              <tr
                className="govuk-table__row"
                key={appointment.appointment_number}
              >
                <td className="govuk-table__row">
                  {appointment.appointment_number}
                </td>
                <td className="govuk-table__row">{appointment.nhs_number}</td>
                <td className="govuk-table__row">
                  {appointment.medical_license}
                </td>
                <td className="govuk-table__row">
                  {appointment.date_of_appointment}
                </td>
                <td className="govuk-table__row">
                  {appointment.time_of_appointment}
                </td>
                <td className="govuk-table__row">
                  {appointment.appointment_notes}
                </td>
                <td className="govuk-table__row">
                  <button
                    className="govuk-button govuk-button--warning"
                    data-module="govuk-button"
                    onClick={() => handleDelete(appointment.appointment_number)}
                  >
                    Delete
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </>
  );
}

export default Appointment;
