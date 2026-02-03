
{{- define "go-echo25694277-f1db-40af-a747-a7643f71650e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo25694277-f1db-40af-a747-a7643f71650e.fullname" -}}
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


{{- define "go-echo25694277-f1db-40af-a747-a7643f71650e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo25694277-f1db-40af-a747-a7643f71650e.labels" -}}
helm.sh/chart: {{ include "go-echo25694277-f1db-40af-a747-a7643f71650e.chart" . }}
{{ include "go-echo25694277-f1db-40af-a747-a7643f71650e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo25694277-f1db-40af-a747-a7643f71650e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo25694277-f1db-40af-a747-a7643f71650e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}