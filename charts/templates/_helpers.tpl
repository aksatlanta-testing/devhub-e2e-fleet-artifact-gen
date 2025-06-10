
{{- define "go-echo29ccf4e1-375b-4a95-b9ee-5784d9daa822.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo29ccf4e1-375b-4a95-b9ee-5784d9daa822.fullname" -}}
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


{{- define "go-echo29ccf4e1-375b-4a95-b9ee-5784d9daa822.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo29ccf4e1-375b-4a95-b9ee-5784d9daa822.labels" -}}
helm.sh/chart: {{ include "go-echo29ccf4e1-375b-4a95-b9ee-5784d9daa822.chart" . }}
{{ include "go-echo29ccf4e1-375b-4a95-b9ee-5784d9daa822.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo29ccf4e1-375b-4a95-b9ee-5784d9daa822.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo29ccf4e1-375b-4a95-b9ee-5784d9daa822.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}