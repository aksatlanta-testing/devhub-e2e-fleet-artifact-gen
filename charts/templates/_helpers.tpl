
{{- define "go-echoe2716a9e-9f80-465f-a56d-374765053780.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe2716a9e-9f80-465f-a56d-374765053780.fullname" -}}
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


{{- define "go-echoe2716a9e-9f80-465f-a56d-374765053780.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe2716a9e-9f80-465f-a56d-374765053780.labels" -}}
helm.sh/chart: {{ include "go-echoe2716a9e-9f80-465f-a56d-374765053780.chart" . }}
{{ include "go-echoe2716a9e-9f80-465f-a56d-374765053780.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe2716a9e-9f80-465f-a56d-374765053780.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe2716a9e-9f80-465f-a56d-374765053780.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}