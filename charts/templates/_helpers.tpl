
{{- define "go-echo67d28ff3-4ecb-46d0-9a17-92d444ce7517.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo67d28ff3-4ecb-46d0-9a17-92d444ce7517.fullname" -}}
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


{{- define "go-echo67d28ff3-4ecb-46d0-9a17-92d444ce7517.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo67d28ff3-4ecb-46d0-9a17-92d444ce7517.labels" -}}
helm.sh/chart: {{ include "go-echo67d28ff3-4ecb-46d0-9a17-92d444ce7517.chart" . }}
{{ include "go-echo67d28ff3-4ecb-46d0-9a17-92d444ce7517.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo67d28ff3-4ecb-46d0-9a17-92d444ce7517.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo67d28ff3-4ecb-46d0-9a17-92d444ce7517.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}