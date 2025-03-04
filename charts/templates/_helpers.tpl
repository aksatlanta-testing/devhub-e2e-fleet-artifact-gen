
{{- define "go-echoaf344ad0-424d-42f7-bbca-b34e5fe3e41e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf344ad0-424d-42f7-bbca-b34e5fe3e41e.fullname" -}}
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


{{- define "go-echoaf344ad0-424d-42f7-bbca-b34e5fe3e41e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf344ad0-424d-42f7-bbca-b34e5fe3e41e.labels" -}}
helm.sh/chart: {{ include "go-echoaf344ad0-424d-42f7-bbca-b34e5fe3e41e.chart" . }}
{{ include "go-echoaf344ad0-424d-42f7-bbca-b34e5fe3e41e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaf344ad0-424d-42f7-bbca-b34e5fe3e41e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaf344ad0-424d-42f7-bbca-b34e5fe3e41e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}