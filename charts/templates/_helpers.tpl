
{{- define "go-echobf6de488-f23b-434f-9d50-29bd2357456e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf6de488-f23b-434f-9d50-29bd2357456e.fullname" -}}
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


{{- define "go-echobf6de488-f23b-434f-9d50-29bd2357456e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf6de488-f23b-434f-9d50-29bd2357456e.labels" -}}
helm.sh/chart: {{ include "go-echobf6de488-f23b-434f-9d50-29bd2357456e.chart" . }}
{{ include "go-echobf6de488-f23b-434f-9d50-29bd2357456e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobf6de488-f23b-434f-9d50-29bd2357456e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobf6de488-f23b-434f-9d50-29bd2357456e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}