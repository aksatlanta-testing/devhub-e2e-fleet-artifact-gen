
{{- define "go-echod7724ab6-7667-468c-b05d-b1ab032949aa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7724ab6-7667-468c-b05d-b1ab032949aa.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echod7724ab6-7667-468c-b05d-b1ab032949aa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod7724ab6-7667-468c-b05d-b1ab032949aa.labels" -}}
helm.sh/chart: {{ include "go-echod7724ab6-7667-468c-b05d-b1ab032949aa.chart" . }}
{{ include "go-echod7724ab6-7667-468c-b05d-b1ab032949aa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod7724ab6-7667-468c-b05d-b1ab032949aa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod7724ab6-7667-468c-b05d-b1ab032949aa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}