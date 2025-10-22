
{{- define "go-echob6b25163-309b-4d3c-a49b-069210db7f51.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob6b25163-309b-4d3c-a49b-069210db7f51.fullname" -}}
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


{{- define "go-echob6b25163-309b-4d3c-a49b-069210db7f51.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob6b25163-309b-4d3c-a49b-069210db7f51.labels" -}}
helm.sh/chart: {{ include "go-echob6b25163-309b-4d3c-a49b-069210db7f51.chart" . }}
{{ include "go-echob6b25163-309b-4d3c-a49b-069210db7f51.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob6b25163-309b-4d3c-a49b-069210db7f51.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob6b25163-309b-4d3c-a49b-069210db7f51.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}