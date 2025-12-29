
{{- define "go-echoa47f045f-dd13-41db-8484-788ef9ae4bea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa47f045f-dd13-41db-8484-788ef9ae4bea.fullname" -}}
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


{{- define "go-echoa47f045f-dd13-41db-8484-788ef9ae4bea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa47f045f-dd13-41db-8484-788ef9ae4bea.labels" -}}
helm.sh/chart: {{ include "go-echoa47f045f-dd13-41db-8484-788ef9ae4bea.chart" . }}
{{ include "go-echoa47f045f-dd13-41db-8484-788ef9ae4bea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa47f045f-dd13-41db-8484-788ef9ae4bea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa47f045f-dd13-41db-8484-788ef9ae4bea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}