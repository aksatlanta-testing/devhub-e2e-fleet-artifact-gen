
{{- define "go-echo420c5c26-363e-4474-8557-7a583353b372.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo420c5c26-363e-4474-8557-7a583353b372.fullname" -}}
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


{{- define "go-echo420c5c26-363e-4474-8557-7a583353b372.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo420c5c26-363e-4474-8557-7a583353b372.labels" -}}
helm.sh/chart: {{ include "go-echo420c5c26-363e-4474-8557-7a583353b372.chart" . }}
{{ include "go-echo420c5c26-363e-4474-8557-7a583353b372.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo420c5c26-363e-4474-8557-7a583353b372.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo420c5c26-363e-4474-8557-7a583353b372.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}