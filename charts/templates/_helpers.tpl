
{{- define "go-echo7813d8da-d91a-433e-862d-922c67f3b9cf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7813d8da-d91a-433e-862d-922c67f3b9cf.fullname" -}}
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


{{- define "go-echo7813d8da-d91a-433e-862d-922c67f3b9cf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7813d8da-d91a-433e-862d-922c67f3b9cf.labels" -}}
helm.sh/chart: {{ include "go-echo7813d8da-d91a-433e-862d-922c67f3b9cf.chart" . }}
{{ include "go-echo7813d8da-d91a-433e-862d-922c67f3b9cf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7813d8da-d91a-433e-862d-922c67f3b9cf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7813d8da-d91a-433e-862d-922c67f3b9cf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}