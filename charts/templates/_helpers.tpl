
{{- define "go-echoc0d69f53-bb84-49ae-b6cb-dcb7001e7bed.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc0d69f53-bb84-49ae-b6cb-dcb7001e7bed.fullname" -}}
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


{{- define "go-echoc0d69f53-bb84-49ae-b6cb-dcb7001e7bed.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc0d69f53-bb84-49ae-b6cb-dcb7001e7bed.labels" -}}
helm.sh/chart: {{ include "go-echoc0d69f53-bb84-49ae-b6cb-dcb7001e7bed.chart" . }}
{{ include "go-echoc0d69f53-bb84-49ae-b6cb-dcb7001e7bed.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc0d69f53-bb84-49ae-b6cb-dcb7001e7bed.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc0d69f53-bb84-49ae-b6cb-dcb7001e7bed.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}