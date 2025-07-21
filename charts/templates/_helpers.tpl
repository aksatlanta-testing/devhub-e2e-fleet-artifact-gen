
{{- define "go-echocc910324-8796-4cc3-abae-dbebc6e0678d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc910324-8796-4cc3-abae-dbebc6e0678d.fullname" -}}
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


{{- define "go-echocc910324-8796-4cc3-abae-dbebc6e0678d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocc910324-8796-4cc3-abae-dbebc6e0678d.labels" -}}
helm.sh/chart: {{ include "go-echocc910324-8796-4cc3-abae-dbebc6e0678d.chart" . }}
{{ include "go-echocc910324-8796-4cc3-abae-dbebc6e0678d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocc910324-8796-4cc3-abae-dbebc6e0678d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocc910324-8796-4cc3-abae-dbebc6e0678d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}