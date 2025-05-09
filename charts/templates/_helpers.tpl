
{{- define "go-echo734a686e-40b8-4b20-9f94-014adee7023c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo734a686e-40b8-4b20-9f94-014adee7023c.fullname" -}}
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


{{- define "go-echo734a686e-40b8-4b20-9f94-014adee7023c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo734a686e-40b8-4b20-9f94-014adee7023c.labels" -}}
helm.sh/chart: {{ include "go-echo734a686e-40b8-4b20-9f94-014adee7023c.chart" . }}
{{ include "go-echo734a686e-40b8-4b20-9f94-014adee7023c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo734a686e-40b8-4b20-9f94-014adee7023c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo734a686e-40b8-4b20-9f94-014adee7023c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}