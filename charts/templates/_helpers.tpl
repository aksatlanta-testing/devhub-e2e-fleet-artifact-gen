
{{- define "go-echo587d4d39-d324-4e6f-b642-f092f2401a4d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo587d4d39-d324-4e6f-b642-f092f2401a4d.fullname" -}}
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


{{- define "go-echo587d4d39-d324-4e6f-b642-f092f2401a4d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo587d4d39-d324-4e6f-b642-f092f2401a4d.labels" -}}
helm.sh/chart: {{ include "go-echo587d4d39-d324-4e6f-b642-f092f2401a4d.chart" . }}
{{ include "go-echo587d4d39-d324-4e6f-b642-f092f2401a4d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo587d4d39-d324-4e6f-b642-f092f2401a4d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo587d4d39-d324-4e6f-b642-f092f2401a4d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}