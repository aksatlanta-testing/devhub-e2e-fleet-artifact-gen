
{{- define "go-echo502d1e10-9427-4a35-8d54-c6b49c926744.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo502d1e10-9427-4a35-8d54-c6b49c926744.fullname" -}}
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


{{- define "go-echo502d1e10-9427-4a35-8d54-c6b49c926744.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo502d1e10-9427-4a35-8d54-c6b49c926744.labels" -}}
helm.sh/chart: {{ include "go-echo502d1e10-9427-4a35-8d54-c6b49c926744.chart" . }}
{{ include "go-echo502d1e10-9427-4a35-8d54-c6b49c926744.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo502d1e10-9427-4a35-8d54-c6b49c926744.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo502d1e10-9427-4a35-8d54-c6b49c926744.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}