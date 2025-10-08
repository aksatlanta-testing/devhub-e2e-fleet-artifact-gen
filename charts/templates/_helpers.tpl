
{{- define "go-echo1838392f-4294-4cd7-a92e-ade130658895.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1838392f-4294-4cd7-a92e-ade130658895.fullname" -}}
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


{{- define "go-echo1838392f-4294-4cd7-a92e-ade130658895.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1838392f-4294-4cd7-a92e-ade130658895.labels" -}}
helm.sh/chart: {{ include "go-echo1838392f-4294-4cd7-a92e-ade130658895.chart" . }}
{{ include "go-echo1838392f-4294-4cd7-a92e-ade130658895.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1838392f-4294-4cd7-a92e-ade130658895.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1838392f-4294-4cd7-a92e-ade130658895.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}