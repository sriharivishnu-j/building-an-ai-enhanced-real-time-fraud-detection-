import { useQuery } from 'react-query';

const fetchFraudData = async () => {
  const res = await fetch('/api/fraud-data');
  if (!res.ok) throw new Error('Network response was not ok');
  return res.json();
};

export default function Home() {
  const { data, error, isLoading } = useQuery('fraudData', fetchFraudData);

  if (isLoading) return <div>Loading...</div>;
  if (error) return <div>Error: {error.message}</div>;

  return (
    <div>
      <h1>Fraud Detection Dashboard</h1>
      <pre>{JSON.stringify(data, null, 2)}</pre>
    </div>
  );
}